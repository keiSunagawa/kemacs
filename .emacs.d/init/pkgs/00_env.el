(use-package exec-path-from-shell
  :config (progn
            (when (memq window-system '(mac ns))
              (exec-path-from-shell-initialize))
            (add-to-list 'exec-path-from-shell-variables "REPO_ROOT")))
