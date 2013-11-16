
(let ((lisp-dir (locate-user-emacs-file "lisp"))
      (--subdirs (lambda (d) (directory-files d t "\\w+"))))

  (add-to-list 'load-path lisp-dir t)
  (require 'cl-lib)

  (let ((subdirs
         (mapcar
          'abbreviate-file-name
          (cl-remove-if-not 'file-directory-p (funcall --subdirs lisp-dir)))))
    (setq load-path (append load-path subdirs)))

  (dolist (init-file (funcall --subdirs (locate-user-emacs-file "init.d")))
    (load init-file t t)))

(require 'magit)
(require 'multiple-cursors)
(require 'uniquify)

(setf auto-save-default nil
      frame-title-format "%b - %F"
      ido-enable-flex-matching t
      (default-value 'indent-tabs-mode) nil
      inhibit-startup-message t
      make-backup-files nil
      (symbol-function 'yes-or-no-p) 'y-or-n-p
      mouse-yank-at-point t
      save-interprogram-paste-before-kill t
      uniquify-buffer-name-style 'forward
      x-select-enable-clipboard t
      x-select-enable-primary t)

(ido-mode 1)
(column-number-mode 1)
