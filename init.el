
(add-to-list 'load-path (concat user-emacs-directory "lisp-personal"))

;; Turn off toolbars, menus, tooltips, and left fringe.
(menu-bar-mode 0)

(when (display-graphic-p)
  (tool-bar-mode 0)
  (scroll-bar-mode 0)
  (tooltip-mode 0)
  (fringe-mode '(0 . 8)))

;; Set load path
(add-to-list 'load-path (directory-file-name user-emacs-directory))
(setq lisp-dir (concat (file-name-as-directory user-emacs-directory) "lisp"))

(add-to-list 'load-path lisp-dir)

(dolist (dir (directory-files lisp-dir t "\\w+"))
  (when (file-directory-p dir)
    (add-to-list 'load-path (abbreviate-file-name dir))))

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

(setq-default indent-tabs-mode nil)

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

(defconst edawg-java-style
  '((c-basic-offset . 2)
    (indent-tabs-mode . nil))
  "Java programming style.")

(defun edawg-set-java-style ()
  (interactive)
  (make-local-variable 'c-tab-always-indent)
  (setq c-tab-always-indent t)
  (c-add-style "Edawg" edawg-java-style t))

(add-hook 'java-mode-hook #'edawg-set-java-style)

;; Remove javascript-mode
(setq auto-mode-alist
      (rassq-delete-all 'javascript-mode auto-mode-alist))

;; Instead, use js2-mode
(autoload 'js2-mode "js2-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))

;; Paredit support

(autoload 'enable-paredit-mode "paredit"
  "Turn on pseudo-structural editing of Lisp code." t)

(dolist (hook '(emacs-lisp-mode-hook
                eval-expression-minibuffer-setup-hook
                ielm-mode-hook
                lisp-mode-hook
                lisp-interaction-mode-hook
                scheme-mode-hook))
  (add-hook hook #'enable-paredit-mode))

(require 'eldoc)
(eldoc-add-command 'paredit-backward-delete 'paredit-close-round)

(dolist (hook '(emacs-lisp-mode-hook
                lisp-interaction-mode-hook))
  (add-hook hook #'turn-on-eldoc-mode))

(add-to-list 'custom-theme-load-path
             (concat (file-name-as-directory user-emacs-directory) "themes"))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (wheatgrass)))
 '(custom-safe-themes (quote ("eb8701083acffcb4ae592fb78f236b3d5f62cdc841e2b83cefbbfdd4126f205c" default)))
 '(global-hl-line-mode t)
 '(ido-enable-flex-matching t)
 '(js2-basic-offset 2)
 '(js2-bounce-indent-p t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(fringe ((t (:background "black"))))
 '(hl-line ((t (:background "#111111")))))
