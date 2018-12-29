(defun get-fortune ()
    (if (executable-find "fortune")
        (with-temp-buffer
           (shell-command "fortune" t)
           (split-string  (buffer-string) "[\n\r]"))
      '("To live is to think.")))
(defun startup-fortune-complete (xs)
  (let ((tail (mapcar #'(lambda (x) (format "               %s" x)) (cdr xs))))
    (reduce (lambda (x y) (format "%s\n%s" x y)) (cons (car xs) tail))))

;; override func
(defun dashboard-insert-ascii-banner-centered:override (file)
  (let ((ftn (startup-fortune-complete (get-fortune))))
    (insert
     (with-temp-buffer
       (insert-file-contents file)
       (concat
        (buffer-string) ftn)))))
(defun dashboard-choose-banner:override ()
  dashboard-startup-banner)

;; (get-fortune)
;; (startup-fortune-complete (get-fortune))


(use-package dashboard
  :init (progn
          (setq inhibit-startup-message t)
          (setq dashboard-startup-banner "~/.emacs.d/startup.mlt")
          (setq dashboard-items '((docs . 5)
                                  (recents  . 10)
                                  (projects . 5)))
          (setq dashboard-docks-file-list '("~/.emacs.d/cheet-sheet.md"))
          ;; override func setting
          (advice-add 'dashboard-insert-ascii-banner-centered :override 'dashboard-insert-ascii-banner-centered:override)
          (advice-add 'dashboard-choose-banner :override 'dashboard-choose-banner:override))
  :config (progn
            (defun dashboard-insert-docs (list-size)
              (dashboard-insert-shortcut "d" "Docs:")
              (dashboard-insert-heading "Docs:")
              (mapc (lambda (el)
                      (insert "\n    ")
                      (widget-create 'push-button
                                     :action `(lambda (&rest ignore) (find-file-existing ,el))
                                     :mouse-face 'highlight
                                     :follow-link "\C-m"
                                     :button-prefix ""
                                     :button-suffix ""
                                     :format "%[%t%]"
                                     (abbreviate-file-name el)))
                    dashboard-docks-file-list))
            (add-to-list 'dashboard-item-generators '(docs . dashboard-insert-docs))
            (dashboard-setup-startup-hook)))
