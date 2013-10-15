
(add-to-list 'load-path (concat user-emacs-directory "lisp-personal"))

(require 'appearance)
(require 'load-path)
(require 'languages)
(require 'key-bindings)
(require 'magit)
(require 'multiple-cursors)
(require 'uniquify)

(setf (default-value 'indent-tabs-mode) nil
      uniquify-buffer-name-style 'forward
      x-select-enable-clipboard t
      frame-title-format "%b - %F"
      x-select-enable-primary t
      save-interprogram-paste-before-kill t
      apropos-do-all t
      ido-enable-flex-matching t
      mouse-yank-at-point t
      make-backup-files nil
      inhibit-startup-message t)

(server-start)
(ido-mode 1)
(column-number-mode 1)
(show-paren-mode 1)
(global-hl-line-mode 1)

(add-to-list 'custom-theme-load-path
             (concat user-emacs-directory "themes"))
