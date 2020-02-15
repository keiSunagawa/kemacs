(use-package kubernetes
  :init (progn
            (setq kubernetes-overview-custom-views-alist '(
                                                          (overview . (context overview pods services)))))
  :commands (kubernetes-overview))
