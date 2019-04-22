(use-package sequential-command)

(define-sequential-command seq-begin
  beginning-of-line beginning-of-buffer seq-return)

(define-sequential-command seq-end
  end-of-line end-of-buffer seq-return)

(define-sequential-command seq-cua
  cua-set-mark cua-set-rectangle-mark seq-return)

(define-sequential-command seq-change-case
  upcase-region downcase-region)

(define-sequential-command seq-backward
  backward-list forward-list seq-return)
