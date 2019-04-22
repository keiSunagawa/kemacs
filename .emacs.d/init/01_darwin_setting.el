(when (eq system-type 'darwin)
  (progn
    (defun copy-from-osx ()
      (shell-command-to-string "pbpaste"))

    (defun paste-to-osx (text &optional push)
      (let ((process-connection-type nil))
        (let ((proc (start-process "pbcopy" "*Messages*" "pbcopy")))
          (process-send-string proc text)
          (process-send-eof proc))))

    (setq interprogram-cut-function 'paste-to-osx)
    (setq interprogram-paste-function 'copy-from-osx)

    (add-to-list 'load-path "~/.emacs.d/lib/site-lisp")
    (require 'eaw)
    (eaw-fullwidth)
    ))

