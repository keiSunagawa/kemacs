(defun k/load (path) (init-loader-load (format "~/.emacs.d/init/%s" path)))
(k/load "initialize")
