;; Turn off toolbars, menus, tooltips, and left fringe.
(menu-bar-mode 0)
(tool-bar-mode 0)
(tooltip-mode 0)

(setq default-frame-alist
      '((left-fringe . 0)
        (right-fringe . 8)))

;; Set theme
(load-theme 'wheatgrass t)

(setq window-system-default-frame-alist
      '((w32 . ((font . "Consolas-10")))))

(set-face-background 'fringe "black")

(provide 'appearance)
