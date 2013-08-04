;; jedi
(add-to-list 'load-path "~/.emacs.d/site-lisp/jedi/emacs-deferred")
(add-to-list 'load-path "~/.emacs.d/site-lisp/jedi/emacs-epc")
(add-to-list 'load-path "~/.emacs.d/site-lisp/jedi/emacs-ctable")
(add-to-list 'load-path "~/.emacs.d/site-lisp/jedi/emacs-jedi")

(require 'auto-complete-config)
(require 'python)
(require 'jedi)
(add-hook 'python-mode-hook 'jedi:setup)
(define-key python-mode-map (kbd "M-TAB") 'jedi:complete)
;(setq jedi:complete-on-dot t)

(add-hook 'python-mode-hook
          (lambda ()
            (define-key python-mode-map "\"" 'electric-pair)
            (define-key python-mode-map "\'" 'electric-pair)
            (define-key python-mode-map "(" 'electric-pair)
            (define-key python-mode-map "[" 'electric-pair)
            (define-key python-mode-map "{" 'electric-pair)))
(defun electric-pair ()
  "Insert character pair without sournding spaces"
  (interactive)
  (let (parens-require-spaces)
    (insert-pair)))
(add-hook 'python-mode-hook '(lambda ()
     (define-key python-mode-map "\C-m" 'newline-and-indent)))
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)

