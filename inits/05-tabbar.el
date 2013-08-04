(require 'popwin)
(popwin-mode 1)

(require 'tabbar)
(tabbar-mode 1)
(global-set-key "\M-]" 'tabbar-forward)  ; Next tab
(global-set-key "\M-[" 'tabbar-backward) ; Previous tab
(setq tabbar-buffer-groups-function nil)
(setq tabbar-separator '(1.0))

(set-face-attribute ; bar colour
  'tabbar-default nil
   :background "white"
   :family "Inconsolata"
   :height 1.0)
(set-face-attribute ; Active tab
  'tabbar-selected nil
  :foreground "red"
  :weight 'bold
  :box nil)
(set-face-attribute ; Inactive tab
  'tabbar-unselected nil
  :foreground "black"
  :box nil)

(defun my-tabbar-buffer-list ()
  (delq nil
        (mapcar #'(lambda (b)
                    (cond
                     ;; Always include the current buffer.
                     ((eq (current-buffer) b) b)
                     ((buffer-file-name b) b)
                     ((char-equal ?\  (aref (buffer-name b) 0)) nil)
                          ((equal "*scratch*" (buffer-name b)) b) ; Shows *scratch* buffer
                               ((char-equal ?* (aref (buffer-name b) 0)) nil) ;
                     ((buffer-live-p b) b)))
                (buffer-list))))
(setq tabbar-buffer-list-function 'my-tabbar-buffer-list)

(dolist (btn '(tabbar-buffer-home-button
               tabbar-scroll-left-button
               tabbar-scroll-right-button))
  (set btn (cons (cons "" nil)
                 (cons "" nil))))


(require 'direx)
(global-set-key (kbd "C-x C-j") 'direx:jump-to-directory)
(push '(direx:direx-mode :position left :width 25 :dedicated t)
      popwin:special-display-config)
(global-set-key (kbd "C-x C-j") 'direx:jump-to-directory-other-window)
