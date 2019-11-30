
;; x 現在のディレクトリを取得
;; x`scala` が出てくるまで現在のディレクトリの親ディレクトリを再帰的に探査
;; x `find . -type d` でディレクトリの一覧を取得
;; x ディレクトリ文字列をパッケージ文字列に変換 e.g. ./hoge/fuga -> hoge.fuga
;; x ivy にてパッケージ文字列を選択
;; x ファイル名の入力
;; x (1) object (2) trait (3) class を選択させる
;; x (なければ)packageディレクトリを作成
;; x package <package> と 最小のソースコードの入ったファイルを生成
;; x 生成したファイルを開く

(defun scala-new-file ()
  "create scala source file in package."
  (interactive)
  (ivy-read "package: "
            (load-current-project-pkgs)
            :preselect (ivy-thing-at-point)
            :history 'counsel-describe-symbol-history
            :require-match nil
            :sort t
            :action 'make-new-file
            :caller 'test-ivy))

(defun load-current-project-pkgs ()
  (kfm/get-package-strings (kfm/get-scala-path (kfm/get-current-path))))

(defun make-new-file (package)
  (let* ((name (kfm/read-filename))
         (mode (kfm/read-mode))
         (file-name (format "%s.scala" name))
         (base-path (kfm/get-scala-path (kfm/get-current-path)))
         (path (kfm/package-to-path package base-path))
         (full-path (format "%s/%s" path file-name))
         (text (kfm/file-text package name mode)))
    (progn
      (message (format "create file: %s" full-path))
      (kfm/make-dir path)
      (f-touch full-path)
      (f-write-text text 'utf-8 full-path)
      (find-file full-path))
    ))
(defun kfm/read-filename ()
  (read-from-minibuffer "name: "))

(defun kfm/read-mode ()
  (let* ((mode-str (read-from-minibuffer "select file behavior 1. object, 2. class, 3. trait, : ")))
    (pcase mode-str
      (`"1" 'select-object)
      (`"2" 'select-class)
      (`"3" 'select-trait)
      (`,_ (kfm/read-mode))
      ))
  )

(defun kfm/package-to-path (package-str base-path)
  (let* ((xs (s-split "\\." package-str))
         (package-path (apply #'f-join xs)))
    (progn
      (message package-path)
      (format "%s/%s" base-path package-path)
      )
    ))

(defun kfm/make-dir (dir-path)
  (if (not (f-exists? dir-path)) (f-mkdir dir-path)))

(defun kfm/file-text (package name select-mode)
  (let* ((code (pcase select-mode
                 (`select-object "object")
                 (`select-class "class")
                 (`select-trait "trait"))))
    (format "package %s\n\n%s %s {}" package code name))
  )

(defun kfm/get-current-path ()
    (if (equal major-mode 'dired-mode)
                         default-directory
                         (f-this-file)
                         ))
(defun this-dirs ()
  (interactive)
  (let* ((current-path (kfm/get-current-path)))
  current-path
  ))

(defun kfm/get-scala-path (path)
  (apply #'f-join (reverse (kfm/get-scala-path/go (reverse (f-split path)))))
  )

(defun kfm/get-scala-path/go (path-list)
  (cond ((equal (car path-list) "scala") path-list)
        ((not path-list) nil)
        (t (kfm/get-scala-path/go (cdr path-list)))))

(defun kfm/get-package-strings (scala-path)
  (let* ((path-list (s-lines (shell-command-to-string (format "find %s -type d" scala-path))))
         (package-list (-map (lambda (path) (kfm/get-package-strings/path-to-scala-package (kfm/get-scala-path/go (f-split path))))
                             path-list))
         ;; remove head for has empty string list exists.
         (result (cdr package-list)))
    result))

(defun kfm/get-package-strings/path-to-scala-package (path-list)
  (let* ((xs (if (equal (car path-list) "scala") (cdr path-list) path-list)))
    (progn
      (string-join xs "."))
      ))
