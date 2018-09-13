;; show line number
(require 'linum)
(global-linum-mode)

;; do not use tab char for indent
(setq-default indent-tabs-mode nil)

;; show `()` highlight
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

;; window move
(global-set-key (kbd "C-x <left>")  'windmove-left)
(global-set-key (kbd "C-x <down>")  'windmove-down)
(global-set-key (kbd "C-x <up>")    'windmove-up)
(global-set-key (kbd "C-x <right>") 'windmove-right)

;; swap kill
(global-set-key (kbd "C-w")  'kill-ring-save)
(global-set-key (kbd "M-w")  'kill-region)

;; copy sync clipbord
;; TODO only mac os
(defun copy-from-osx ()
 (shell-command-to-string "pbpaste"))

(defun paste-to-osx (text &optional push)
 (let ((process-connection-type nil))
     (let ((proc (start-process "pbcopy" "*Messages*" "pbcopy")))
       (process-send-string proc text)
       (process-send-eof proc))))

(setq interprogram-cut-function 'paste-to-osx)
(setq interprogram-paste-function 'copy-from-osx)

;; auto insert pair char
(electric-pair-mode 1)

;; cua-mode
(cua-mode t)
(setq cua-enable-cua-keys nil)
(global-set-key (kbd "C-c r")  'cua-set-rectangle-mark)

;; :)
(setq make-backup-files nil)

;; white-space setting
(global-whitespace-mode t)
(add-hook 'before-save-hook' delete-trailing-whitespace)
(setq whitespace-display-mappings
      '(
        (space-mark   ?\     [?·]     [?.])
        (space-mark   ?\xA0  [?¤]     [?_])
        (newline-mark ?\n    [?↵ ?\n] [?$ ?\n])
        (tab-mark     ?\t    [?» ?\t] [?\\ ?\t])))
