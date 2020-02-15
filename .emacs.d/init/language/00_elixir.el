(use-package elixir-mode
  :config (progn
            (add-hook 'elixir-mode-hook 'highlight-symbol-mode)
            (add-to-list 'elixir-mode-hook
                         (defun auto-activate-ruby-end-mode-for-elixir-mode ()
                           (set (make-variable-buffer-local 'ruby-end-expand-keywords-before-re)
                                "\\(?:^\\|\\s-+\\)\\(?:do\\)")
                           (set (make-variable-buffer-local 'ruby-end-check-statement-modifiers) nil)
                           (ruby-end-mode +1)))))
(use-package alchemist)
;; (use-package ac-alchemist
;;   :config (progn
;;             (add-to-list 'elixir-mode-hook 'ac-alchemist-setup)))

(use-package flycheck-elixir
  :config (progn
            (add-hook 'elixir-mode-hook 'flycheck-mode)))
