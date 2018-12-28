(use-package undo-tree
  :config (progn
            (global-undo-tree-mode)))

(use-package helm
  :config (progn
            (require 'helm-config)
            (helm-mode 1)))

(use-package swiper)
(use-package expand-region)

(use-package helm-descbinds
  :config
  (progn
    (helm-descbinds-mode)))

(use-package elscreen
  :config (progn
            (elscreen-start)))

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

(use-package highlight-symbol
  :config (progn
            (add-hook 'emacs-lisp-mode-hook 'highlight-symbol-mode)
            ;; (add-hook 'scala-mode-hook 'highlight-symbol-mode)
            (setq highlight-symbol-idle-delay 0.5)))

(use-package projectile
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

(use-package direx)

(use-package exec-path-from-shell
  :config (progn
            (when (memq window-system '(mac ns))
              (exec-path-from-shell-initialize))
            (add-to-list 'exec-path-from-shell-variables "REPO_ROOT")))

(use-package ace-jump-mode
  :config (progn
            (setq ace-jump-mode-move-keys
                  (append "asdfghjkl;:]qwertyuiop@zxcvbnm,." nil))
            (setq ace-jump-word-mode-use-query-char nil)))

;; text file syntax support
(use-package markdown-mode)
(use-package csv-mode)
(use-package yaml-mode)
(use-package dockerfile-mode
  :config (progn
            (add-to-list 'auto-mode-alist '("Dockerfile\\'" . dockerfile-mode))))
(use-package aa-edit-mode)

;; ui
(use-package madhat2r-theme)
(use-package dashboard
  :init (progn
          (setq inhibit-startup-message t)
          (setq dashboard-startup-banner "~/.emacs.d/startup.mlt")
          (setq dashboard-items '((docs . 5)
                                  (recents  . 10)
                                  (projects . 5)))
          (setq dashboard-docks-file-list '("~/.emacs.d/cheet-sheet.md"))
          ;; override func setting
          (defun dashboard-insert-ascii-banner-centered:override (file)
            (insert
             (with-temp-buffer
               (insert-file-contents file)
               (buffer-string))))
 ;;         (add-to-list 'dashboard-item-generators '(docks . dashboard-qiita-insert))
         (defun dashboard-choose-banner:override ()
           dashboard-startup-banner)
          (advice-add 'dashboard-insert-ascii-banner-centered :override 'dashboard-insert-ascii-banner-centered:override)
          (advice-add 'dashboard-choose-banner :override 'dashboard-choose-banner:override))
  :config (progn
            (defun dashboard-insert-docs (list-size)
              (dashboard-insert-shortcut "d" "Docs:")
              (dashboard-insert-heading "Docs:")
              (mapc (lambda (el)
                      (insert "\n    ")
                      (widget-create 'push-button
                                     :action `(lambda (&rest ignore) (find-file-existing ,el))
                                     :mouse-face 'highlight
                                     :follow-link "\C-m"
                                     :button-prefix ""
                                     :button-suffix ""
                                     :format "%[%t%]"
                                     (abbreviate-file-name el)))
                    dashboard-docks-file-list))
            (add-to-list 'dashboard-item-generators '(docs . dashboard-insert-docs))
            (dashboard-setup-startup-hook)))
