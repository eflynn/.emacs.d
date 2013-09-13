
;; Turn off toolbars, menus, tooltips, and left fringe. This should be
;; called early in startup to avoid momentary display flash.
(ignore-errors
  (menu-bar-mode -1)
  (tool-bar-mode -1)
  (scroll-bar-mode -1)
  (fringe-mode '(0 . 8)))

;; Set load path
(add-to-list 'load-path user-emacs-directory)
(setq site-lisp-dir
      (concat user-emacs-directory "site-lisp/"))

(require 'cl)

(loop for rel in (directory-files site-lisp-dir nil "\\w+")
      for dir = (concat site-lisp-dir rel)
      when (file-directory-p dir)
      do (add-to-list 'load-path dir))

(require 'bindings)
(require 'god-mode)
(autoload 'magit-status "magit")

(server-start)

(ido-mode)
(setq ido-enable-flex-matching t)

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

;; Set default font
(add-to-list 'default-frame-alist '(font . "Dejavu Sans Mono-10"))

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

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (wheatgrass))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
