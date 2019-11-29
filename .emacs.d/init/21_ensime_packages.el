(use-package sbt-mode
  :commands sbt-start sbt-command
  :config
  ;; WORKAROUND: https://github.com/ensime/emacs-sbt-mode/issues/31
  ;; allows using SPACE when in the minibuffer
  (substitute-key-definition
   'minibuffer-complete-word
   'self-insert-command
   minibuffer-local-completion-map))

(use-package scala-mode
  :config (progn
            (add-hook 'scala-mode-hook #'yas-minor-mode)
            (if (not use-scala-metals) (add-hook 'scala-mode-hook '(lambda () (flycheck-mode -1))))
            ))


(when use-scala-metals
  (use-package lsp-mode
    :straight (:repo "https://github.com/emacs-lsp/lsp-mode" :branch "master")
    :init (setq lsp-prefer-flymake nil)
    :config (progn
              (add-hook 'before-save-hook '(lambda ()
                                             (when (and (stringp buffer-file-name) (string-match "\\.scala\\'" buffer-file-name))
                                               (lsp-format-buffer)))))
        :hook (scala-mode . lsp))
      (use-package company-lsp)
      ;; (use-package lsp-scala
      ;;   :straight (:repo "https://github.com/rossabaker/lsp-scala" :branch "master")
      ;;   :after scala-mode
      ;;   :demand t
      ;;   ;; Optional - enable lsp-scala automatically in scala files
      ;;   
      ;;   )
  )

;;aaa") metals

;; Enable nice rendering of diagnostics like compile errors.
(use-package lsp-ui)

;; Add company-lsp backend for metals



;; (add-hook 'scala-mode-hook #'lsp)
