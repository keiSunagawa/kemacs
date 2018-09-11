(defun add-to-load-path (&rest paths)
  ;; do not overwrite existing variable
  (let (path)
    (dolist (path paths)
      (let ((default-directory (expand-file-name (concat user-emacs-directory path))))
	(add-to-list 'load-path default-directory)
	;; run normal-top-level-add-subdirs-to-load-path function if defined
	(if (fboundp 'normal-top-level-add-subdirs-to-load-path)
	    (normal-top-level-add-subdirs-to-load-path))
	))))

(add-to-load-path "elisp" "conf" "public_repos")

;; show line number
(require 'linum)
(global-linum-mode)

;; dont use tab char for indent
(setq-default indent-tabs-mode nil)

(setq show-paren-delay 0)
(show-paren-mode t)

;; auto reload buffer
(global-auto-revert-mode t)

;; cursor elisp doc
(add-hook 'emacs-lisp-mode-hook
          '(lambda ()
             (when (require 'eldoc nil t)
               (setq eldoc-idle-delay 0.2)
               (setq eldoc-echo-area-use-multiline-p t)
               (turn-on-eldoc-mode))))
;; ELPA setting
(require 'package)
(add-to-list 'package-archives
             '("marmalade" . "https://marmalade-repo.org/packages/"))
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))
(add-to-list 'package-archives
             '("melpa-stable" . "https://stable.melpa.org/packages/") t)

(package-initialize)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("f153e8ed90e4d79cf2c61560da2b3091d2f3b94da42aaddc707012be4608cf52" "3e83abe75cebf5621e34ce1cbe6e12e4d80766bed0755033febed5794d0c69bf" default)))
 '(package-selected-packages
   (quote
    (darktooth-theme autumn-light-theme ensime use-package elscreen auto-complete helm-descbinds helm undo-tree))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(when (require 'undo-tree nil t)
  (global-undo-tree-mode))

(global-set-key (kbd "C-x <left>")  'windmove-left)
(global-set-key (kbd "C-x <down>")  'windmove-down)
(global-set-key (kbd "C-x <up>")    'windmove-up)
(global-set-key (kbd "C-x <right>") 'windmove-right)

;; helm
(require 'helm-config)
(require 'helm-descbinds)
(helm-descbinds-mode)

;; auto complete
(when (require 'auto-complete-config nil t)
  (define-key ac-mode-map (kbd "M-TAB") 'auto-complete)
  (ac-config-default)
  (setq ac-use-menu-map t)
  (setq ac-ignore-case nil)
  )
;; elscreen
(when (require 'elscreen nil t)
  (elscreen-start))

(global-set-key (kbd "C-z <left>")  'elscreen-previous)
(global-set-key (kbd "C-z <right>")  'elscreen-next)

;; cua-mode
(cua-mode t)
(setq cua-enable-cua-keys nil)
(global-set-key (kbd "C-c r")  'cua-set-rectangle-mark)

;; emsime
(use-package ensime
  :ensure t
  :pin melpa)

(use-package sbt-mode
  :pin melpa)

(use-package scala-mode
  :pin melpa)

(add-to-list 'exec-path "/usr/local/bin")

;; (setq projectile-use-git-grep t)
;; (projectile-global-mode t)
;;  :bind   (("s-f" . projectile-find-file)
;;           ("s-F" . projectile-grep)))

(load-theme 'darktooth t)

(defun copy-from-osx ()
 (shell-command-to-string "pbpaste"))

(defun paste-to-osx (text &optional push)
 (let ((process-connection-type nil))
     (let ((proc (start-process "pbcopy" "*Messages*" "pbcopy")))
       (process-send-string proc text)
       (process-send-eof proc))))

(setq interprogram-cut-function 'paste-to-osx)
(setq interprogram-paste-function 'copy-from-osx)

(electric-pair-mode 1)
(setq make-backup-files nil)
