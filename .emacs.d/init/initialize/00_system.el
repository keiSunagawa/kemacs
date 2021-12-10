;; auto reload buffer
(global-auto-revert-mode t)

;; Cursor elisp doc
(add-hook 'emacs-lisp-mode-hook
          '(lambda ()
             (when (require 'eldoc nil t)
               (setq eldoc-idle-delay 0.2)
               (setq eldoc-echo-area-use-multiline-p t)
               (turn-on-eldoc-mode))))

;; auto insert pair char
(electric-pair-mode 1)

;; enable *case-region function
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)

;; cua-mode
(setq cua-toggle-set-mark nil)
(setq cua-enable-cua-keys nil)
(cua-mode t)

;; :)
(setq make-backup-files nil)
(setq auto-save-default nil)

;; white-space setting
(global-whitespace-mode t)

(defun delete-wspace()
  (when (eq major-mode 'markdown-mode)
    delete-trailing-whitespace))

(add-hook 'before-save-hook' delete-wspace)

(setq whitespace-display-mappings
      '(
        ;; (space-mark   ?\     [?·]     [?.])
        (space-mark   ?\xA0  [?¤]     [?_])
        (newline-mark ?\n    [?↵ ?\n] [?$ ?\n])
        (tab-mark     ?\t    [?» ?\t] [?\\ ?\t])))
(setq whitespace-line-column 250)

;; set scroll line
;; (setq scroll-conservatively 1)

(menu-bar-mode -1)
(set-keyboard-coding-system 'utf-8-emacs-mac)

(global-superword-mode 1)
;; recentf
(setq recentf-max-saved-items 30)
(recentf-mode 1)

 (setq create-lockfiles nil)
;; deplicate linum-mode ><
;; show line number
;; (require 'linum)
;; (global-linum-mode)
