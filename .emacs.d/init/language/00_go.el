(add-to-list 'exec-path (expand-file-name "/Users/ksunagawa/go/bin/"))

;; Golang
(defun lsp-go-install-save-hooks()
  (add-hook 'before-save-hook #'lsp-format-buffer t t)
  (add-hook 'before-save-hook #'lsp-organize-imports t t))

(use-package go-mode
  :mode (("\\.go\\'" . go-mode))
  :init
  (add-hook 'go-mode-hook #'lsp-go-install-save-hooks))

;; (use-package lsp-mode
;;   :ensure t
;;   :hook
  
;;   )

(use-package lsp-ui
  :ensure t
  :commands lsp-ui-mode)

(use-package company-lsp
  :ensure t
  :commands company-lsp)
;; (use-package lsp-ui
;;   :ensure t
;;   :commands lsp-ui-mode)

;; (use-package company-lsp
;;   :ensure t
;;   :commands company-lsp)
;; (use-package go-mode
;;   :config (progn
;;             (add-hook 'go-mode-hook 'flycheck-mode)
;;             (add-hook 'go-mode-hook (lambda()
;;                                       (add-hook 'before-save-hook' 'gofmt-before-save)
;;                                       (local-set-key (kbd "M-.") 'godef-jump)
;;                                       ;; (set (make-local-variable 'company-backends) '(company-go))
;;                                       (setq indent-tabs-mode t)    ; タブを利用
;;                                       (setq c-basic-offset 4)    ; tabサイズを4にする
;;                                       (setq tab-width 4)))))

;; (use-package company-go)
;; (use-package go-eldoc
;;   :config (add-hook 'go-mode-hook 'go-eldoc-setup))
