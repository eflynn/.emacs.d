(setq load-path (cons "~/.emacs.d/color-theme" load-path))
(require 'color-theme)

(eval-after-load "color-theme"
  '(progn
     (color-theme-initialize)
     (color-theme-hober)))

(color-theme-midnight)
(ido-mode 1)

;; Turn off menus, toolbar, and scrollbars.
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

(windmove-default-keybindings)
(setq make-backup-files nil)
