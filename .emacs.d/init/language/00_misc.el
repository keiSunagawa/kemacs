(use-package markdown-mode)
(use-package csv-mode)
(use-package yaml-mode)
(use-package terraform-mode
  :config (progn
            (add-hook 'before-save-hook '(lambda () (when (derived-mode-p 'terraform-mode) (terraform-format-buffer))))))

(use-package dockerfile-mode
  :config (progn
            (add-to-list 'auto-mode-alist '("Dockerfile\\'" . dockerfile-mode))))

(use-package mustache)
(use-package mustache-mode
  :straight (:repo "https://github.com/mustache/emacs" :branch "master"))
(use-package dhall-mode
  :mode "\\.dhall\\'")
(use-package graphviz-dot-mode)

(use-package thrift-mode
  :mode "\\.thrift\\'")
(use-package plantuml-mode)

(use-package protobuf-mode)

(use-package rego-mode
  :straight (:repo "https://github.com/psibi/rego-mode" :branch "master"))
