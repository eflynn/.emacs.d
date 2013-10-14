;; Set load-path
(let* ((lisp (concat user-emacs-directory "lisp"))
       (files (cons lisp (directory-files lisp t "\\w+")))
       (find-dirs
        (lambda (d) (and (file-directory-p d) (abbreviate-file-name d))))
       (dirs (remq nil (mapcar find-dirs files))))

  (setq load-path (append dirs load-path)))

(provide 'load-path)
