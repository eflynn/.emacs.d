;; Turn off toolbars, menus, tooltips, and left fringe.
(require 'tool-bar)
(require 'tooltip)

(tooltip-mode 0)
(tool-bar-mode 0)

(setq default-frame-alist
      '((menu-bar-lines . 0)
        (left-fringe . 0)
        (right-fringe . 8)))

;; Set theme
(add-to-list 'custom-theme-load-path
             (concat user-emacs-directory "themes"))

(load-theme 'wheatgrass t)

(add-hook 'prog-mode-hook 'show-paren-mode)

(setq window-system-default-frame-alist
      '((w32 . ((font . "Consolas-10")))))

(set-face-background 'fringe "black")

(provide 'appearance)
