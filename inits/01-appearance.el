(global-font-lock-mode t)
(setq inhibit-startup-message t)
(setq default-frame-alist
      (append '((font . "fontset-16"))))

;tab
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)

(line-number-mode 1)
(column-number-mode 1)

(show-paren-mode 1)

;; scratch buffer msg is off
(setq initial-scratch-message "")

;; Off the menu bar
(if window-system (menu-bar-mode 1) (menu-bar-mode -1))

;; Title bar
(setq frame-title-format (format "Emacs@%s : %%f" (system-name)))
(set-default 'mode-line-buffer-identification ; shows full path of the opening file
	     '(buffer-file-name ("%f") ("%b")))

;; mode line
(set-face-foreground 'mode-line "green") ; bar colour

;; Display time on mode-line
(setq display-time-string-forms
  '((substring year -2) "/" month "/" day " " dayname " " 24-hours ":" minutes))
(display-time)

(setq scroll-conservatively 35
  scroll-margin 0
  scroll-step 1)


(require 'cua-rect)
(cua-mode t)
(setq cua-enable-cua-keys nil)

(defadvice cua-set-mark (around start-rectangle-mark activate)
  (if (and (region-active-p) (eq last-command 'cua-set-mark))
      (cua-toggle-rectangle-mark)
    ad-do-it))
