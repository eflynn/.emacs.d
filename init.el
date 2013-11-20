
(add-to-list 'load-path (locate-user-emacs-file "lisp"))

(require 'package)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/") t)
(setq package-enable-at-startup nil)

(package-initialize)

(unless package-archive-contents
  (package-refresh-contents))

(defvar my-packages
  '(clojure-mode
    clojure-test-mode
    cider
    idle-highlight-mode
    js2-mode
    magit
    multiple-cursors
    paredit
    php-mode
    smex
    yasnippet)
  "A list of packages to ensure are installed at launch.")

(dolist (p my-packages)
  (unless (package-installed-p p)
    (package-install p)))

;; Load settings from init.d
(let* ((dir (locate-user-emacs-file "init.d"))
       (files (directory-files dir nil "\\w+")))
  (dolist (f files)
    (load (expand-file-name (file-name-sans-extension f) dir) t t)))
