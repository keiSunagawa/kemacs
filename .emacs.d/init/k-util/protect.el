;; -- ADT
;; (k/fail <error>) : fail on k/forgelin body, has error value.
;; (k/succ <value>) : success k/forgelin body, has return value from body.

(defmacro k/forgelin (body)
  `(condition-case ev
     (list 'k/succ ,body)
  (error (list 'k/fail ev))))

(defmacro F (&rest xs) `(k/forgelin ,xs))

;; F[A] => (A => F[B]) => F[B]
(defun k/bind (adt f)
  (pcase adt
    (`(k/succ ,v) (funcall f v))
    (`(k/fail ,ev) (list 'k/fail ev))))

;;

(defmacro k/do (bodies)
  (car (_k/do-f (-map (lambda (b) `,b) bodies))))

(defun _k/do-f (bodies)
  (-reduce-from '_k/do-one '('start nil) bodies))

(defun _k/do-one (acm next)
  (let* ((stx (car acm))
         (env (cdr acm)))
    (_k/do-parse-phase stx env next)))

(defun _k/do-parse-phase (stx env body)
  (pcase body
    (`(,v <- ,f) (_k/do-eval-bind v f stx env))
    (`,n (error (format "unmatch syntax %s" n)))
    ))

;; ret: (ret env)
(defun _k/do-eval-bind (v f stx env)
  (progn (message (format "%s" f))
  (cons (eval f) env)))

;; (defun _k/do-parse-let () 1)
(defun _k/do-eval-pure () 1)
(defun _k/do-eval-row () 1)

(provide 'protect)
