(add-to-list 'load-path "~/.emacs.d/")

(require 'color-theme)

(eval-after-load "color-theme"
  '(progn
     (color-theme-initialize)
     (color-theme-midnight)))

