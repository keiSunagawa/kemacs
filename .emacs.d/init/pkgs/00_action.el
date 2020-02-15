(use-package undo-tree
  :config (progn
            (global-undo-tree-mode)))

(use-package expand-region)

(use-package ace-jump-mode
  :custom (ace-jump-mode-move-keys
           (append "asdfghjkl;:]qwertyuiop@zxcvbnm,." nil))
           (ace-jump-word-mode-use-query-char nil))

(use-package multiple-cursors
  :straight (:repo "https://github.com/magnars/multiple-cursors.el.git" :branch "master"))

(use-package madhat2r-theme)
