(defun is-project-dir ()
  (direx-project:find-project-root-noselect
   (or buffer-file-name default-directory)))

(defun my-direx-jump-project-root ()
  (interactive)
  (if (is-project-dir) (direx-project:jump-to-project-root)
    (dired-jump))
  )
