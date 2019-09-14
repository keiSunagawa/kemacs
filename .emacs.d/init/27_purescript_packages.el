(use-package purescript-mode)
(use-package psc-ide
  :config (progn
            (add-hook 'purescript-mode-hook
                      (lambda ()
                        (yas-minor-mode)
                        (psc-ide-mode)
                        (company-mode)
                        (flycheck-mode)
                        (turn-on-purescript-indentation)))))
