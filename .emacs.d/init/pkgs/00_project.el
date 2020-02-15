(use-package projectile
  ;; project-root find rule
  :init (progn
          (setq projectile-project-root-files-functions
                '(projectile-root-local
                  projectile-root-top-down
                  projectile-root-bottom-up
                  projectile-root-top-down-recurring)))
  :config (progn
            (projectile-global-mode)
            ;;(setq projectile-completion-system 'helm)
            (add-to-list 'projectile-project-root-files "package.json")
            (add-to-list 'projectile-project-root-files ".gitignore")
            (add-to-list 'projectile-project-root-files ".projectroot")))

(use-package counsel-projectile)

;; projectile like root find function
(defun kerfume/direx-project:vc-root-p (dirname)
  (cl-loop for vc-dir in projectile-project-root-files
           thereis (file-exists-p (expand-file-name vc-dir dirname))))
(use-package direx
  :init (progn
          (setq direx-project:project-root-predicate-functions '(kerfume/direx-project:vc-root-p))))
