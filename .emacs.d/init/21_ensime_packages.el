(use-package ensime
  :straight (:repo "https://github.com/ensime/ensime-emacs" :branch "2.0")
  :init (progn
          (setq ensime-eldoc-hints 'error))
  :config (progn
            (add-to-list 'exec-path "/usr/local/bin")))

(use-package sbt-mode)

(use-package scala-mode
  :config (progn (add-hook 'scala-mode-hook '(lambda ()
                                              (global-auto-complete-mode -1)))))
