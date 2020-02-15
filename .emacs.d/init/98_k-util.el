(add-to-list 'load-path "~/.emacs.d/init/k-util")

(require 'protect)

(defmacro k-dbg (prefix v)
  `(progn (message (format ,prefix ,v)) ,v))
