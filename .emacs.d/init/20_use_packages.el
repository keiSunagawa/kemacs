;; packages
(use-package undo-tree
  :config (progn
            (global-undo-tree-mode)))

(use-package helm
  :config (progn
            (require 'helm-config)
            (helm-mode 1)))

(use-package helm-descbinds
  :config
  (progn
    (helm-descbinds-mode)))

(use-package elscreen
  :config (progn
            (elscreen-start)
            ;; needs run after elscreen-start
            (global-set-key (kbd "C-z <left>")  'elscreen-previous)
            (global-set-key (kbd "C-z <right>")  'elscreen-next)))

(use-package auto-complete
  :bind (
        :map ac-mode-map
             ("M-TAB" . auto-complete))
  :config (progn
            ;; don't needs require ?
            (require 'auto-complete-config)
            (ac-config-default)
            (setq ac-use-menu-map t)
            (setq ac-ignore-case nil)))

(use-package ensime
  :bind (
         ("C-t" . ensime-type-at-point-full-name)
         ("C-c e" . ensime-print-errors-at-point)
         ("C-i" . ensime-import-type-at-point))
  :straight (:repo "https://github.com/ensime/ensime-emacs" :branch "2.0")
  :config (progn
            (add-to-list 'exec-path "/usr/local/bin")))

(use-package sbt-mode)
(use-package scala-mode)

(use-package highlight-symbol
  :config (progn
            (add-hook 'emacs-lisp-mode-hook 'highlight-symbol-mode)
            (add-hook 'scala-mode-hook 'highlight-symbol-mode)
            (setq highlight-symbol-idle-delay 0.5)))

;; thema
(use-package darktooth-theme
  :config (progn
            (load-theme 'darktooth t)))
