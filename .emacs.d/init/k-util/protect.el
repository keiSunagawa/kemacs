;; -- ADT
;; (k/fail <error>) : fail on k/forgelin body, has error value.
;; (k/succ <value>) : success k/forgelin body, has return value from body.

(defmacro k/forgelin (body)
  `(condition-case ev
     (list 'k/succ ,body)
  (error (list 'k/fail ev))))

(defmacro F (&rest xs) `(k/forgelin ,xs))

;; A => F[A]
(defun k/pure (a) (list 'k/succ a))

;; F[A] => (A => F[B]) => F[B]
(defun k/bind (adt f)
  (pcase adt
    (`(k/succ ,v) (funcall f v))
    (`(k/fail ,ev) (list 'k/fail ev))))

;; F[A] => (A => B) => F[B]
(defun k/map (adt f)
  (pcase adt
    (`(k/succ ,v) (list 'k/succ (funcall f v)))
    (`(k/fail ,ev) (list 'k/fail ev))))


;;----------------------------
;;(k/do (
;;        (a <- (F + 1 5))
;;        (b <- (F + a 2))
;;        (pure (+ a b))
;;       ))
;;------------------------------
;; (defmacro k/do (bodies)
;;   (car (_k/do-f (-map (lambda (b) `,b) bodies))))
(defmacro k/do (bodies) `(_k/do-f ',bodies))

(defun _k/do-f (bodies)
  (let* ((h (car bodies))
         ;; first : F[(A, env)]
         (first (_k/do-parse-phase nil h)))
    (-reduce-from '_k/do-one first (cdr bodies))))

;; F[(A, env)] => ast => F[(A, env)]
(defun _k/do-one (acm next)
  (k/bind acm (lambda (k)
                (let* ((ret (car k))
                       (env (cdr k)))
                  (_k/do-parse-phase env next)))))

;; env => ast => F[(A, env)]
(defun _k/do-parse-phase (env body)
  (pcase body
    (`(,sym <- ,f) (_k/do-eval-bind sym f env))
    (`(pure ,f) (_k/do-eval-pure f env))
    (`,f (_k/do-eval-row f env))
    (`,n (error (format "unmatch syntax %s" n)))
    ))

;; ret: symbol => (=> F[A]) => env => F[(A, env)]
(defun _k/do-eval-bind (sym f env)
  (progn
    (message (format "%s" f))
    (k/map (eval (_k/replace-var-list f env)) (lambda (res)
                       (let* ((new-env (cons (list sym res) env)))
                       (cons res new-env))))))

;; (defun _k/do-parse-let () 1)
(defun _k/do-eval-row (f env) (k/map (eval (_k/replace-var-list f env)) (lambda (rf) (cons rf env))))
(defun _k/do-eval-pure (f env) (k/map (k/pure (eval (_k/replace-var-list f env))) (lambda (rf) (cons rf env))))

(defun _k/replace-var-list (f env) (-map (lambda (v) (_k/replace-var v env)) f))

(defun _k/replace-var (v env)
  (cond
       ((symbolp v) (_k/do-replace v env))
       ((listp v) (_k/replace-var-list v env))
       (t v)
  ))

(defun _k/do-replace (v env)
  (progn
    (message (format "env is %s" env))
    (message (format "key is %s" v))
    (message (format "lookup is %s" (assoc v env)))
    (let* ((lookv (cadr (assoc v env))))
    (if (null lookv) v lookv)
    )))

(provide 'protect)
