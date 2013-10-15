
(add-to-list 'load-path (concat user-emacs-directory "lisp-personal"))

(require 'load-path)
(require 'languages)

;; Turn off toolbars, menus, tooltips, and left fringe.
(menu-bar-mode 0)

(when (display-graphic-p)
  (tool-bar-mode 0)
  (scroll-bar-mode 0)
  (tooltip-mode 0)
  (fringe-mode '(0 . 8)))

(require 'key-bindings)
(autoload 'magit-status "magit")

;; Load multiple-cursors
(require 'multiple-cursors)

(server-start)

(ido-mode)

;; Configure save-place
(setq-default save-place t)
(require 'saveplace)
(setq save-place-file (concat user-emacs-directory "places"))

(require 'uniquify)
(setq uniquify-buffer-name-style 'forward)

(column-number-mode 1)
(show-paren-mode 1)

(setq x-select-enable-clipboard t
      frame-title-format "%b - %F"
      x-select-enable-primary t
      save-interprogram-paste-before-kill t
      apropos-do-all t
      mouse-yank-at-point t
      backup-directory-alist `(("." . ,(concat user-emacs-directory
                                               "backups")))
      inhibit-startup-message t)

(when (eq system-type 'windows-nt)
  ;; Set default font
  (add-to-list 'default-frame-alist '(font . "Consolas-10")))

(add-to-list 'custom-theme-load-path
             (concat user-emacs-directory "themes"))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (wheatgrass)))
 '(custom-safe-themes (quote ("eb8701083acffcb4ae592fb78f236b3d5f62cdc841e2b83cefbbfdd4126f205c" default)))
 '(global-hl-line-mode t)
 '(ido-enable-flex-matching t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(fringe ((t (:background "black"))))
 '(hl-line ((t (:background "#111111")))))
