
;; Turn off toolbars, menus, tooltips, and left fringe. This should be
;; called early in startup to avoid momentary display flash.
(ignore-errors
  (menu-bar-mode -1)
  (tool-bar-mode -1)
  (scroll-bar-mode -1)
  (fringe-mode '(0 . 8)))

(require 'cl)

;; Set load path
(add-to-list 'load-path user-emacs-directory)
(let ((default-directory (format "%s/site-lisp/" user-emacs-directory)))
  (normal-top-level-add-subdirs-to-load-path))

;; Color theme
(require 'color-theme)
(color-theme-initialize)
(color-theme-midnight)

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

(setq init/font (find-if (lambda (f) (find-font (font-spec :name f)))
			 '("Terminus-11" "Courier New-11")))

;; TODO: read up on faces
(when init/font
  (set-face-attribute 'default nil :font init/font))

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
