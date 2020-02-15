(add-to-list 'exec-path (expand-file-name "/Users/sunakawamegumi/go/bin/"))

(use-package go-mode
  :config (progn
            (add-hook 'go-mode-hook 'flycheck-mode)
            (add-hook 'go-mode-hook (lambda()
                                      (add-hook 'before-save-hook' 'gofmt-before-save)
                                      (local-set-key (kbd "M-.") 'godef-jump)
                                      (set (make-local-variable 'company-backends) '(company-go))
                                      (setq indent-tabs-mode nil)    ; タブを利用
                                      (setq c-basic-offset 4)    ; tabサイズを4にする
                                      (setq tab-width 4)))))

(use-package company-go)
(use-package go-eldoc
  :config (add-hook 'go-mode-hook 'go-eldoc-setup))
