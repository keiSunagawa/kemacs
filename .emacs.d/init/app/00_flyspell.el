(use-package flyspell
  :config  (progn
             (setq ispell-program-name "aspell"
                   ;; force the English dictionary, support Camel Case spelling check (tested with aspell 0.6)
                   ispell-extra-args '("--sug-mode=ultra" "--lang=en_US" "--run-together" "--run-together-limit=5" "--run-together-min=2"))))

(custom-theme-set-faces
 'madhat2r
 '(flyspell-duplicate ((t (:weight bold :underline (:color "#ff0000" :style wave)))))
 '(flyspell-incorrect ((t (:weight bold :underline (:color "#ff0000" :style wave))))))

(mapc
 (lambda (hook)
   (add-hook hook
             '(lambda () (flyspell-mode 1))))
 '(
   ;;scala-mode-hook
   ;;rust-mode-hook
   ))
