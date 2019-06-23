;; disaibled ensime
;; (use-package ensime
;;   :straight (:repo "https://github.com/ensime/ensime-emacs" :branch "2.0")
;;   :init (progn
;;           (setq ensime-eldoc-hints 'error))
;;   :config (progn
;;             (add-to-list 'exec-path "/usr/local/bin")))

(use-package sbt-mode
  :commands sbt-start sbt-command
  :config
  ;; WORKAROUND: https://github.com/ensime/emacs-sbt-mode/issues/31
  ;; allows using SPACE when in the minibuffer
  (substitute-key-definition
   'minibuffer-complete-word
   'self-insert-command
   minibuffer-local-completion-map))

(use-package scala-mode
  :config (progn (add-hook 'scala-mode-hook '(lambda ()
                                              (global-auto-complete-mode -1)))))

;; metals
(use-package lsp-mode
  :straight (:repo "https://github.com/emacs-lsp/lsp-mode" :branch "master")
  :init (setq lsp-prefer-flymake nil))

;; Enable nice rendering of diagnostics like compile errors.

;; (use-package lsp-ui
;;   :straight (:repo "https://github.com/emacs-lsp/lsp-ui" :branch "master")
;;   :hook (lsp-mode . lsp-ui-mode))

;; Add company-lsp backend for metals
(use-package company-lsp)

(use-package lsp-scala
  :straight (:repo "https://github.com/rossabaker/lsp-scala" :branch "master")
  :after scala-mode
  :demand t
  ;; Optional - enable lsp-scala automatically in scala files
  :hook (scala-mode . lsp))
;; (add-hook 'scala-mode-hook #'lsp)
