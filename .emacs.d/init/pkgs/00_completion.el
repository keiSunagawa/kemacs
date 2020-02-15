(use-package company
  :init (progn
          (setq company-transformers '(company-sort-by-occurrence))
          (setq company-idle-delay 0)
          (setq company-minimum-prefix-length 2)
          (setq company-selection-wrap-around t)
          (setq completion-ignore-case t)
          (setq company-dabbrev-downcase nil))
  :config (progn
            (global-company-mode)))

(use-package yasnippet
  :straight (:repo "https://github.com/joaotavora/yasnippet" :branch "master")
  :config (progn
            (yas-reload-all)
            (add-hook 'makefile-bsdmake-mode-hook #'yas-minor-mode)))
