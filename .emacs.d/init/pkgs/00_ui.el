(use-package rainbow-delimiters
  :config (add-hook 'prog-mode-hook 'rainbow-delimiters-mode))

(use-package highlight-symbol
  :config (progn
            (add-hook 'emacs-lisp-mode-hook 'highlight-symbol-mode)
            ;; (add-hook 'scala-mode-hook 'highlight-symbol-mode)
            (setq highlight-symbol-idle-delay 0.5)))

(use-package elscreen
  :config (progn
            (elscreen-start)))

(use-package golden-ratio
  :config (progn
            (golden-ratio-mode)))

(use-package flycheck
  :init (global-flycheck-mode)
  :config (progn
            (setq-default flycheck-disabled-checkers '(emacs-lisp-checkdoc))))
