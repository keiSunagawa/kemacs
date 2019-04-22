;; straight settings
(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 5))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

(straight-use-package 'use-package)
(setq straight-use-package-by-default t)

(use-package init-loader)

;; init
(init-loader-load "~/.emacs.d/init")
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-tooltip-selection ((t (:background "color-17" :foreground "#afd7d7"))))
 '(font-lock-constant-face ((t (:foreground "magenta"))))
 '(font-lock-string-face ((t (:foreground "thistle2"))))
 '(font-lock-type-face ((t (:inherit bold :foreground "color-29"))))
 '(helm-selection ((t (:background "color-22" :foreground "color-41"))))
 '(helm-selection-line ((t (:background "#4e4e4e" :foreground "color-41"))))
 '(highlight-symbol-face ((t (:background "color-18" :foreground "cyan" :width normal)))))
