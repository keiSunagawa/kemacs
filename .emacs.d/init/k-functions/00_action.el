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
