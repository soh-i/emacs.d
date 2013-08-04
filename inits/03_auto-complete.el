(require 'auto-complete)
(require 'auto-complete-config)
(global-auto-complete-mode t)
(setq ac-auto-start nil)
(ac-set-trigger-key "TAB")
(setq ac-use-fuzzy t)
(add-to-list 'ac-dictionary-directories "/home/soh.i/.emacs.d/elpa/auto-complete-20130724.1750/dict")
(ac-config-default)


