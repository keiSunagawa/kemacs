(use-package rust-mode
  :config (progn
            (setq-default rust-format-on-save t)
            (add-to-list 'auto-mode-alist '("\\.rs\\'" . rust-mode))))

(setq racer-rust-src-path "/Users/sunakawamegumi/.rustup/toolchains/stable-x86_64-apple-darwin/lib/rustlib/src/rust/src/")
(use-package racer
  :config
  (progn
    (add-hook 'rust-mode-hook #'racer-mode)
    (add-hook 'racer-mode-hook #'eldoc-mode)
    (add-hook 'racer-mode-hook #'company-mode)
    (define-key rust-mode-map (kbd "TAB") #'company-indent-or-complete-common)
    (setq company-tooltip-align-annotations t))
  )

(use-package flycheck-rust
  :init
  (add-hook 'rust-mode-hook
            '(lambda ()
               (flycheck-mode)
               (flycheck-rust-setup))))

;; use-rustic
;; (use-package eglot)
;; (use-package rustic
;;  :init (setq rustic-rls-pkg 'eglot))
