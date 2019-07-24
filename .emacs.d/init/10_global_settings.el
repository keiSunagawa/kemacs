;; deplicate linum-mode ><
;; show line number
;; (require 'linum)
;; (global-linum-mode)

(require 'server)
(unless (server-running-p)
  (server-start))
(setq truncate-lines nil)
(setq truncate-partial-width-windows nil)

;; enable *case-region function
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)
;; do not use tab char for indent
(setq-default indent-tabs-mode nil)

;; show `()` highlight
(setq show-paren-delay 0)
(show-paren-mode t)

;; (add-hook 'after-init-hook #'global-flycheck-mode)
;; auto reload buffer
(global-auto-revert-mode t)

;; step scroll
(defun step-down ()
  (interactive)
  (next-line 5))
(defun step-up ()
  (interactive)
  (previous-line 5))

(defun backward-kill-line (arg)
  "Kill chars backward until encountering the end of a line."
  (interactive "p")
  (kill-line 0))

(defun goto-dashboard ()
  (interactive)
  (switch-to-buffer "*dashboard*"))

(defun my-completion ()
  (interactive)
  (company-begin-backend 'company-dabbrev))

;; Cursor elisp doc
(add-hook 'emacs-lisp-mode-hook
          '(lambda ()
             (when (require 'eldoc nil t)
               (setq eldoc-idle-delay 0.2)
               (setq eldoc-echo-area-use-multiline-p t)
               (turn-on-eldoc-mode))))

;; auto insert pair char
(electric-pair-mode 1)

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
(setq js-indent-level 2)
(global-superword-mode 1)
;; recentf
(setq recentf-max-saved-items 30)
(recentf-mode 1)
