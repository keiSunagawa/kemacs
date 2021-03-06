(use-package general)

(general-define-key
 "C-a" 'seq-begin
 "C-e" 'seq-end
 "C-d" 'z-dir
 "C-s" 'swiper
 "C-r" 'ace-jump-mode
 "C-@" 'seq-cua
 "C-TAB" 'elscreen-next
 "M-]" 'mc/mark-next-like-this
 "M-[" 'mc/mark-previous-like-this
 "M-C-]" 'mc/mark-next-word-like-this
 "M-C-[" 'mc/mark-previous-word-like-this
 "M-n" 'step-down
 "M-p" 'step-up
 "M-k" 'backward-kill-line
 "M-q" 'transpose-chars
 "M-x" 'counsel-M-x
 "M-y" 'helm-show-kill-ring
 "M-w" 'er/expand-region
 "M-u" 'seq-change-case
 "C-M-d" 'goto-dashboard
 "C-M-p" 'seq-backward
 )


(general-define-key
 :prefix "C-x"
 "<left>" 'windmove-left
 "F" 'windmove-left
 "<down>" 'windmove-down
 "N" 'windmove-down
 "<up>" 'windmove-up
 "P" 'windmove-up
 "<right>" 'windmove-right
 "F" 'windmove-right
 "f" 'indent-region
 "p" 'counsel-projectile-find-file
 "g" 'counsel-projectile-grep
 "d" 'my-direx-jump-project-root
 "b" 'counsel-switch-buffer
 "C-f" 'counsel-find-file
 "m" 'switch-window
 )

;; (general-define-key
;;  :prefix "C-c"
;;  "C-f" 'helm-recentf
;;  )
(general-define-key
 :prefix "C-z"
 "b" 'elscreen-previous
 "f" 'elscreen-next
 )

;; company
(general-define-key
 "TAB" 'my-completion
 )
(general-define-key
 :keymaps 'company-active-map
 "C-n" 'company-select-next
 "C-p" 'company-select-previous
 "C-a" 'company-other-backend
 )
(general-define-key
 :keymaps 'company-search-map
 "C-n" 'company-select-next
 "C-p" 'company-select-previous
 )

;; ensime
(general-define-key
 :keymaps 'ensime-mode-map
 "C-t" 'ensime-type-at-point-full-name
 "C-i" 'ensime-import-type-at-point
 )
(general-define-key
 :keymaps 'ensime-mode-map
 :prefix "C-c"
 "e" 'ensime-print-errors-at-point
 )

;; yasnippet
(general-define-key
  :keymaps 'yas-minor-mode-map
  :prefix "C-c"
  "i" 'yas-expand
 )

;; ivy minibuffer input
(general-define-key
  :keymaps 'ivy-minibuffer-map
  "C-a" 'ivy-insert-current
 )

;; org mode
;; (general-define-key
;;  :keymaps 'org-mode-map
;;  :prefix "C-o"
;;  "t" 'org-todo
;;  "c" 'org-ctrl-c-ctrl-c
;;  )

;; scala
(general-define-key
 :keymaps 'lsp-mode-map
 :prefix "C-c"
 "a" 'lsp-execute-code-action
 )
