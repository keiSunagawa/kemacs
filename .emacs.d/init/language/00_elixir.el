;; (use-package alchemist
;;   :init (progn
;;           (setq alchemist-mix-command "/Users/kei.sunagawa/.asdf/shims/mix")))

(use-package elixir-mode
  
  :config (progn
            (add-hook 'elixir-mode-hook 'highlight-symbol-mode)
            )
  )
  ;;           (add-hook 'elixir-mode-hook 'alchemist-mode)
  ;;           ;; (add-to-list 'elixir-mode-hook
  ;;           ;;              (defun auto-activate-ruby-end-mode-for-elixir-mode ()
  ;;           ;;                (set (make-variable-buffer-local 'ruby-end-expand-keywords-before-re)
  ;;           ;;                     "\\(?:^\\|\\s-+\\)\\(?:do\\)")
  ;;           ;;                (set (make-variable-buffer-local 'ruby-end-check-statement-modifiers) nil)
  ;;           ;;                (ruby-end-mode +1)))
  ;;           ))

(use-package lsp-mode
  :commands lsp
  :ensure t
  :diminish lsp-mode
  :hook
  (elixir-mode . lsp)
  :init
  (add-to-list 'exec-path "/Users/kei.sunagawa/Downloads/elixir-ls")
  :config
  (progn
    (setq lsp-elixir-suggest-specs nil)))

  (use-package company-lsp)
  (use-package lsp-ui)


;; (use-package ac-alchemist
;;   :config (progn
;;             (add-to-list 'elixir-mode-hook 'ac-alchemist-setup)))

;; (use-package flycheck-mix
;;   :straight (:repo "https://github.com/tomekowal/flycheck-mix" :branch "master")
;;  :ensure t
;;   :config (progn
;;             (add-hook 'elixir-mode-hook 'flycheck-mode)
;;             (flycheck-mix-setup)
;;             ;; (add-to-list 'flycheck-checkers 'elixir-mix)
;;             )
;;   )

(use-package flycheck-credo
  :init (add-hook 'flycheck-mode-hook 'flycheck-credo-setup))

;; (use-package flycheck-elixir
;;   :config (progn
;;             (add-hook 'elixir-mode-hook 'flycheck-mode)))

;; (use-package ruby-end
;;   :straight (:repo "https://github.com/rejeep/ruby-end.el" :branch "master")
;;   :config (progn
;;             (add-hook 'elixir-mode-hook 'ruby-end-mod)))
;; -

(use-package exunit)
