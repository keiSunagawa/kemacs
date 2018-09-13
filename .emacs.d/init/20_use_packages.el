;; packages
(use-package undo-tree
  :config (progn
            (global-undo-tree-mode)))

(use-package helm
  :bind (
         ([remap execute-extended-command] . helm-M-x))
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

(use-package easy-kill
  :bind (
         ([remap kill-ring-save] . easy-kill)
         :map easy-kill-base-map
         ("k" . easy-kill-region)
         ("<up>" . easy-kill-shrink)
         ("<down>" . easy-kill-expand)))

(use-package markdown-mode)

(use-package projectile
  :bind (
      ("C-x p" . projectile-find-file)
      ("C-x g" . projectile-grep))
  ;; project-root find rule
  :init (progn
          (setq projectile-project-root-files-functions
          '(projectile-root-local
            projectile-root-top-down
            projectile-root-top-down-recurring
            projectile-root-bottom-up)))
  :config (progn
            (projectile-global-mode)
            (setq projectile-completion-system 'helm)))

(use-package helm-projectile
  :config (progn
            (helm-projectile-on)))

;; thema
(use-package darktooth-theme
  :config (progn
            (load-theme 'darktooth t)))
