(menu-bar-mode -1)
(tool-bar-mode -1)

(setq load-path (cons "~/.emacs.d/color-theme-6.6.0" load-path))
(require 'color-theme)

(eval-after-load "color-theme"
		'(progn
		   (color-theme-initialize)
		   (color-theme-hober)))
