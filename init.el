
(let ((lisp-dir (locate-user-emacs-file "lisp"))
      (--subdirs (lambda (d) (directory-files d t "\\w+"))))

  (add-to-list 'load-path lisp-dir t)
  (require 'cl-lib)

  (let ((subdirs
         (mapcar
          'abbreviate-file-name
          (cl-remove-if-not 'file-directory-p (funcall --subdirs lisp-dir)))))
    (setq load-path (append load-path subdirs)))

  ;; Bootstrap init.d files
  (dolist (init-file (funcall --subdirs (locate-user-emacs-file "init.d")))
    (load init-file t t)))
