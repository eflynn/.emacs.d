
(add-to-list 'load-path (concat user-emacs-directory "lisp-personal"))

(require 'appearance)
(require 'load-path)
(require 'languages)
(require 'key-bindings)
(require 'magit)
(require 'multiple-cursors)
(require 'uniquify)

(setf auto-save-default nil
      frame-title-format "%b - %F"
      ido-enable-flex-matching t
      (default-value 'indent-tabs-mode) nil
      inhibit-startup-message t
      make-backup-files nil
      mouse-yank-at-point t
      save-interprogram-paste-before-kill t
      uniquify-buffer-name-style 'forward
      x-select-enable-clipboard t
      x-select-enable-primary t)

(server-start)
(ido-mode 1)
(column-number-mode 1)
(show-paren-mode 1)
(global-hl-line-mode 1)

(add-to-list 'custom-theme-load-path
             (concat user-emacs-directory "themes"))
