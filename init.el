(setq load-path (cons "~/.emacs.d/color-theme" load-path))
(require 'color-theme)

(eval-after-load "color-theme"
  '(progn
     (color-theme-initialize)
     (color-theme-hober)))

(color-theme-midnight)
(ido-mode 1)

;; Turn off menus, toolbar, and scrollbars.
(menu-bar-mode 0)

(if window-system
    (progn
      (tool-bar-mode 0)
      (scroll-bar-mode 0)))

(windmove-default-keybindings)
(setq make-backup-files nil
      css-indent-offset 2)
(server-start)
