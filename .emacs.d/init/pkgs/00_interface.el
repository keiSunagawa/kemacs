;; helm
(use-package helm
  :config (progn
            (require 'helm-config)
            (helm-mode 1)))

(use-package helm-descbinds
  :config
  (progn
    (helm-descbinds-mode)))

;; ivy
(use-package counsel
  :custom
  (ivy-use-virtual-buffers t)
  (ivy-height 50)
  (ivy-count-format "(%d/%d) ")
  (enable-recursive-minibuffers t)
  (ivy-use-selectable-prompt t "Make the prompt line selectable")
  :config (progn
            (setq ivy-re-builders-alist '((t . ivy--regex-ignore-order)))
            (setq ivy-initial-inputs-alist nil)))


(use-package swiper)
