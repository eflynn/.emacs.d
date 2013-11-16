;; Settings

(require 'uniquify)

(setf auto-save-default nil
      frame-title-format "%b - %F"
      ido-enable-flex-matching t
      (default-value 'indent-tabs-mode) nil
      inhibit-default-init t
      inhibit-startup-message t
      make-backup-files nil
      (symbol-function 'yes-or-no-p) 'y-or-n-p
      mouse-yank-at-point t
      save-interprogram-paste-before-kill t
      uniquify-buffer-name-style 'forward
      x-select-enable-clipboard t
      x-select-enable-primary t)

(add-hook 'emacs-startup-hook 'ido-mode)
(add-hook 'emacs-startup-hook 'column-number-mode)
