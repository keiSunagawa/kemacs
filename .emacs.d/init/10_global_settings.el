;; deplicate linum-mode ><
;; show line number
;; (require 'linum)
;; (global-linum-mode)

(require 'server)
(unless (server-running-p)
  (server-start))
(set-default 'truncate-lines t)
;; do not use tab char for indent
(setq-default indent-tabs-mode nil)

;; show `()` highlight
(setq show-paren-delay 0)
(show-paren-mode t)

;; auto reload buffer
(global-auto-revert-mode t)

;; step scroll
(defun step-down ()
  (interactive)
  (next-line 5))
(defun step-up ()
  (interactive)
  (previous-line 5))

(global-set-key (kbd "ESC n") 'step-down)
(global-set-key (kbd "ESC p") 'step-up)
(global-set-key (kbd "C-M-n") 'step-down)
(global-set-key (kbd "C-M-p") 'step-up)

(defun backward-kill-line (arg)
  "Kill chars backward until encountering the end of a line."
  (interactive "p")
  (kill-line 0))
(global-set-key (kbd "M-k") 'backward-kill-line)

;; Cursor elisp doc
(add-hook 'emacs-lisp-mode-hook
          '(lambda ()
             (when (require 'eldoc nil t)
               (setq eldoc-idle-delay 0.2)
               (setq eldoc-echo-area-use-multiline-p t)
               (turn-on-eldoc-mode))))

;; window move
(global-set-key (kbd "C-x <left>")  'windmove-left)
(global-set-key (kbd "C-x <down>")  'windmove-down)
(global-set-key (kbd "C-x <up>")    'windmove-up)
(global-set-key (kbd "C-x <right>") 'windmove-right)
(global-set-key (kbd "C-x B")  'windmove-left)
(global-set-key (kbd "C-x N")  'windmove-down)
(global-set-key (kbd "C-x P")    'windmove-up)
(global-set-key (kbd "C-x F") 'windmove-right)

;; swap kill
;; (global-set-key (kbd "C-w")  'kill-ring-save)
;; (global-set-key (kbd "M-w")  'kill-region)

;; copy sync clipbord
(if (eq system-type 'darwin)
    (progn
      (defun copy-from-osx ()
        (shell-command-to-string "pbpaste"))

      (defun paste-to-osx (text &optional push)
        (let ((process-connection-type nil))
          (let ((proc (start-process "pbcopy" "*Messages*" "pbcopy")))
            (process-send-string proc text)
            (process-send-eof proc))))

      (setq interprogram-cut-function 'paste-to-osx)
      (setq interprogram-paste-function 'copy-from-osx)))

;; auto insert pair char
(electric-pair-mode 1)

;; cua-mode
(cua-mode t)
(setq cua-enable-cua-keys nil)
(global-set-key (kbd "C-c r")  'cua-set-rectangle-mark)

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

;; indent reformat
(global-set-key (kbd "C-x f") 'indent-region)

;; set scroll line
;; (setq scroll-conservatively 1)

;; swap char
(global-set-key (kbd "M-q") 'transpose-chars)

(menu-bar-mode -1)
(set-keyboard-coding-system 'utf-8-emacs-mac)
;; (add-to-list 'load-path "~/.emacs.d/lib/ruby_end")
;; (require 'ruby-end)
;; (add-to-list 'load-path "~/.emacs.d/lib/lsp-scala")

;; (defun entry-my-syntax()
;;   (message "aaaaa")
;;   (modify-syntax-entry ?_ "w" (standard-syntax-table))
;;   (modify-syntax-entry ?- "w" (standard-syntax-table)))

;; (add-hook 'after-change-major-mode-hook 'superword-mode)
(global-superword-mode 1)
;; recentf
(setq recentf-max-saved-items 30)
(recentf-mode 1)
