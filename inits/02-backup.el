;; Save back up file
(setq make-backup-files t)
(setq backup-directory-alist(cons
                             (cons "\\.*$" (expand-file-name "~/.emacs-back"))
                             backup-directory-alist))
