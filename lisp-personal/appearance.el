;; Turn off toolbars, menus, tooltips, and left fringe.
(menu-bar-mode 0)

(when (display-graphic-p)
  (tool-bar-mode 0)
  (scroll-bar-mode 0)
  (tooltip-mode 0)
  (fringe-mode '(0 . 8)))

;; Set theme
(load-theme 'wheatgrass t)

(when (eq system-type 'windows-nt)
  ;; Set default font when on windows
  (add-to-list 'default-frame-alist '(font . "Consolas-10")))

(set-face-background 'fringe "black")
(eval-after-load 'hl-line
  '(set-face-background 'hl-line "#111111"))

(provide 'appearance)
