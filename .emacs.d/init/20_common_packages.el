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

(use-package yasnippet
  :straight (:repo "https://github.com/joaotavora/yasnippet" :branch "master")
  :config (progn
            (yas-reload-all)
            (add-hook 'makefile-bsdmake-mode-hook #'yas-minor-mode)))

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
                  projectile-root-bottom-up
                  projectile-root-top-down-recurring)))
  :config (progn
            (projectile-global-mode)
            (setq projectile-completion-system 'helm)
            (add-to-list 'projectile-project-root-files "package.json")
            (add-to-list 'projectile-project-root-files ".gitignore")
            (add-to-list 'projectile-project-root-files ".projectroot")))

(use-package helm-projectile
  :config (progn
            (helm-projectile-on)))

;; projectile like root find function
(defun kerfume/direx-project:vc-root-p (dirname)
  (cl-loop for vc-dir in projectile-project-root-files
           thereis (file-exists-p (expand-file-name vc-dir dirname))))
(use-package direx
  :init (progn
          (setq direx-project:project-root-predicate-functions '(kerfume/direx-project:vc-root-p))))

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

(use-package multiple-cursors)

;; text file syntax support
(use-package markdown-mode)
(use-package csv-mode)
(use-package yaml-mode)
(use-package terraform-mode
  :config (progn
            (add-hook 'before-save-hook '(lambda () (when (derived-mode-p 'terraform-mode) (terraform-format-buffer))))))

(use-package dockerfile-mode
  :config (progn
            (add-to-list 'auto-mode-alist '("Dockerfile\\'" . dockerfile-mode))))
(use-package aa-edit-mode)

;; ui
(use-package rainbow-delimiters
  :config (add-hook 'prog-mode-hook 'rainbow-delimiters-mode))

(use-package madhat2r-theme)

(use-package flycheck
  :init (global-flycheck-mode)
  :config (progn
            (setq-default flycheck-disabled-checkers '(emacs-lisp-checkdoc))))

(use-package golden-ratio
  :config (progn
            (golden-ratio-mode)))

(use-package kubernetes
  :commands (kubernetes-overview))

;; used better helm switch buffer
;; (use-package nswbuff
;; :s1;5Ctraight (:repo "https://github.com/joostkremers/nswbuff" :branch "master")
;;  :1;5Cinit (setq nswbuff-exclude-buffer-regexps '("^ .*" "^\\*.*\\*")))
