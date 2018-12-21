;; packages
(use-package undo-tree
  :config (progn
            (global-undo-tree-mode)))
(use-package yaml-mode)

(use-package helm
  :bind (
         ([remap execute-extended-command] . helm-M-x))
  :config (progn
            (require 'helm-config)
            (helm-mode 1)))

(use-package swiper-helm)

(use-package helm-descbinds
  :config
  (progn
    (helm-descbinds-mode)))

(use-package elscreen
  :config (progn
            (elscreen-start)
            ;; needs run after elscreen-start
            (global-set-key (kbd "C-z b")  'elscreen-previous)
            (global-set-key (kbd "C-z f")  'elscreen-next)))

;; (use-package auto-complete
;;   :bind (
;;         :map ac-mode-map
;;              ("M-TAB" . auto-complete))
;;   :config (progn
;;             ;; don't needs require ?
;;             (require 'auto-complete-config)
;;             (ac-config-default)
;;             (setq ac-use-menu-map t)
;;             (setq ac-ignore-case nil)
;;             (ac-set-trigger-key "TAB")
;;             (global-auto-complete-mode t)))
;; auto-completeと競合しないかな…
(use-package company
  :bind (
         :map company-active-map
              ("C-n" . company-select-next)
              ("C-p" . company-select-previous)
         :map company-search-map
         ("C-n" . company-select-next)
         ("C-p" . company-select-previous))
  :config (progn
            (global-company-mode)))

(use-package ensime
  :bind (
         ("C-t" . ensime-type-at-point-full-name)
         ("C-c e" . ensime-print-errors-at-point)
         ("C-i" . ensime-import-type-at-point))
  :straight (:repo "https://github.com/ensime/ensime-emacs" :branch "2.0")
  :init (progn
          (setq ensime-eldoc-hints 'type))
  :config (progn
            (add-to-list 'exec-path "/usr/local/bin")))

(use-package lsp-mode)
(use-package sbt-mode)
;; (require 'lsp-scala)
(use-package scala-mode
  :config (progn (add-hook 'scala-mode-hook '(lambda ()
                                              (global-auto-complete-mode -1)))))

(use-package highlight-symbol
  :config (progn
            (add-hook 'emacs-lisp-mode-hook 'highlight-symbol-mode)
            ;; (add-hook 'scala-mode-hook 'highlight-symbol-mode)
            (setq highlight-symbol-idle-delay 0.5)))

(use-package easy-kill
  :bind (
         ([remap kill-ring-save] . easy-kill)
         :map easy-kill-base-map
         ("k" . easy-kill-region)
         ("C-p" . easy-kill-shrink)
         ("C-n" . easy-kill-expand)))

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
            (setq projectile-completion-system 'helm)
            (add-to-list 'projectile-project-root-files "package.json")))

(use-package helm-projectile
  :config (progn
            (helm-projectile-on)))

(use-package direx
  :bind (
         ("C-x d" . direx:jump-to-directory)))

(use-package aa-edit-mode)

;; thema
;; (use-package darktooth-theme)
;;  :config (progn
;;            (load-theme 'darktooth t)))
(use-package madhat2r-theme)

;; elixir
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
(use-package ac-alchemist
  :config (progn
            (add-to-list 'elixir-mode-hook 'ac-alchemist-setup)))
(use-package flycheck-elixir
  :config (progn
            (add-hook 'elixir-mode-hook 'flycheck-mode)))

(use-package csv-mode)

;; rust
(use-package rust-mode
  :config (progn
            (setq-default rust-format-on-save t)
            (add-to-list 'auto-mode-alist '("\\.rs\\'" . rust-mode))))

(use-package racer
  :config
  (add-hook 'rust-mode-hook #'racer-mode)
  (add-hook 'racer-mode-hook #'eldoc-mode)
  (add-hook 'racer-mode-hook #'company-mode)
  (define-key rust-mode-map (kbd "TAB") #'company-indent-or-complete-common)
  (setq company-tooltip-align-annotations t))

(use-package flycheck-rust
  :init
  (add-hook 'rust-mode-hook
            '(lambda ()
               (flycheck-mode)
               (flycheck-rust-setup))))

(use-package go-mode)
;; auto-compleat
(add-to-list 'ac-modes 'rust-mode)
(add-to-list 'ac-modes 'fundamental-mode)
(add-to-list 'ac-modes 'text-mode)

(use-package exec-path-from-shell
  :config (progn
            (when (memq window-system '(mac ns))
              (exec-path-from-shell-initialize))
            (add-to-list 'exec-path-from-shell-variables "REPO_ROOT")))


;; typescript
(use-package typescript-mode
  :mode (
         ("\\.ts\\'" . typescript-mode)
         ("\\.tsx\\'" . typescript-mode)))

(use-package tide)

(defun setup-tide-mode ()
  (interactive)
  (tide-setup)
  (flycheck-mode +1)
  (setq flycheck-check-syntax-automatically '(save mode-enabled))
  (eldoc-mode +1)
  (tide-hl-identifier-mode +1)
  ;; company is an optional dependency. You have to
  ;; install it separately via package-install
  ;; `M-x package-install [ret] company`
  (company-mode +1))

;; aligns annotation to the right hand side
(setq company-tooltip-align-annotations t)

;; formats the buffer before saving
;; (add-hook 'before-save-hook 'tide-format-before-save)

(add-hook 'typescript-mode-hook #'setup-tide-mode)

(use-package web-mode
  :mode (("\\.html?\\'" . web-mode)
         ("\\.tsx\\'" . web-mode)
         ("\\.jsx\\'" . web-mode))
  :config
  (setq web-mode-markup-indent-offset 2
        web-mode-css-indent-offset 2
        web-mode-code-indent-offset 2
        web-mode-block-padding 2
        web-mode-comment-style 2

        web-mode-enable-css-colorization t
        web-mode-enable-auto-pairing t
        web-mode-enable-comment-keywords t
        web-mode-enable-current-element-highlight t
        )
  (add-hook 'web-mode-hook
            (lambda ()
              (when (string-equal "tsx" (file-name-extension buffer-file-name))
                (setup-tide-mode))))
  ;; enable typescript-tslint checker
  (flycheck-add-mode 'typescript-tslint 'web-mode))

(use-package dockerfile-mode
  :config (progn
            (add-to-list 'auto-mode-alist '("Dockerfile\\'" . dockerfile-mode))))

