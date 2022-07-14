(require 'flycheck)

(flycheck-define-checker
 elixir-mix
 "Defines a checker for elixir with mix compile.
  The project must be valid mix project with =mix.exs= file"
 :command ("elixir"
           "-e"
           (eval (flycheck-mix-cd-and-set-mix-env))
           "-S"
           "mix"
           "compile")
 :error-patterns
 ((warning line-start
           "warning:"
           ;; Multiline warnings
           (message (minimal-match (one-or-more anything)))
           (file-name "lib/" (minimal-match (one-or-more not-newline)) )
           ":"
           line
           line-end)
   (error line-start
          "** ("
          (one-or-more word)
          "Error) "
          (file-name)
          ":"
          line
          ": "
          (message)
          line-end))
 :error-filter
 (lambda (errors)
   (dolist (err (flycheck-sanitize-errors errors))
     (setf (flycheck-error-filename err)
           (concat (flycheck-mix-project-root)
                   (flycheck-error-filename err))))
   errors)
 :modes (elixir-mode)
 :predicate (lambda ()
              (and
               (flycheck-buffer-saved-p)
               (flycheck-mix-project-root))))

(defun flycheck-mix-project-root ()
  "Return directory where =mix.exs= is located."
  (locate-dominating-file buffer-file-name "mix.exs"))

(defun flycheck-mix-cd-and-set-mix-env ()
  "Generate change directory command for elixir executable."
  (format "IEx.Helpers.cd(\"%s\"); Mix.start(); Mix.env(:test)"
          (shell-quote-argument (flycheck-mix-project-root))
          ))

;;;###autoload
(defun flycheck-mix-setup ()
  "Setup Flycheck for Elixir."
  (interactive)
  (message "This package is deprecated and will be removed from Melpa. Please, use lsp-mode instead https://elixirforum.com/t/emacs-elixir-setup-configuration-wiki/")
  (add-to-list 'flycheck-checkers 'elixir-mix t))
