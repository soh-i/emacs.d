;; perl-completion
(add-hook 'cperl-mode-hook
          (lambda()
            (require 'perl-completion)
            (perl-completion-mode t)))

(add-hook  'cperl-mode-hook
           (lambda ()
             (when (require 'auto-complete nil t) ; no error whatever auto-complete.el is not installed.
               (auto-complete-mode t)
               (make-variable-buffer-local 'ac-sources)
               (setq ac-sources
                     '(ac-source-perl-completion)))))


;; perl-tidy
(defun perltidy-region ()
  "Run perltidy on the current region."
  (interactive)
  (save-excursion
    (shell-command-on-region (point) (mark)"perltidy -q" nil t)))
(defun perltidy-defun()
  "Run perltidy on the current defun."
  (interactive)
  (save-excursion (mark-defun)
                  (perltidy-region)))

;; cperl-mode
(defalias 'perl-mode 'cperl-mode)
(setq auto-mode-alist (cons '("\\.t$" . cperl-mode) auto-mode-alist))
(add-hook 'cperl-mode-hook
          '(lambda ()
             (cperl-set-style "PerlStyle")))
(setq cperl-highlight-variables-indiscriminately t)
(add-hook 'cperl-mode-hook
          '(lambda ()
             (font-lock-mode 1)

             (set-face-underline-p 'underline nil)

             (set-face-foreground 'cperl-array-face "blue")
             (set-face-background 'cperl-array-face "nil")

             (set-face-foreground 'cperl-hash-face "yellow")
             (set-face-background 'cperl-hash-face "nil")

             (set-face-foreground 'font-lock-function-name-face "magenta")
             (set-face-foreground 'font-lock-comment-face "red")
             (set-face-foreground 'font-lock-string-face "white")

))
