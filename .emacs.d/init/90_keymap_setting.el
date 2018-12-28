(use-package general)

(general-define-key
 "C-s" 'swiper
 "C-r" 'ace-jump-word-mode
 "M-n" 'step-down
 "M-p" 'step-up
 "M-k" 'backward-kill-line
 "M-q" 'transpose-chars
 "M-x" 'helm-M-x
 "M-y" 'helm-show-kill-ring
 "M-w" 'er/expand-region
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
 "p" 'projectile-find-file
 "g" 'projectile-grep
 "d" 'direx:jump-to-directory
 )
(general-define-key
 :prefix "C-c"
 ;; seacential 追加したら消す
 "r" 'cua-set-rectangle-mark
 "C-f" 'helm-recentf
 )
(general-define-key
 :prefix "C-z"
 "b" 'elscreen-previous
 "f" 'elscreen-next
 )

;; company
(general-define-key
 :keymaps 'company-active-map
 "C-n" 'company-select-next
 "C-p" 'company-select-previous
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