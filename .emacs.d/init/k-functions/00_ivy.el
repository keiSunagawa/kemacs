(defun load-z-dir ()
  (let* ((xs (s-trim (f-read-text "~/.local/share/z/data")))
         (xs2 (s-split "\n" xs)))
    (mapcar (lambda (path-with-info) (car (s-slice-at "|" path-with-info))) xs2)))

(defun z-dir ()
  "fish function z for emacs."
  (interactive)
  (ivy-read "select path: "
            (load-z-dir)
            :preselect (ivy-thing-at-point)
            :history 'counsel-describe-symbol-history
            :require-match t
            :sort t
            :action 'find-file
            :caller 'test-ivy))
