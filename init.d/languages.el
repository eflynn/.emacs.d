;;; languages.el --- configuration for various programming languages

(eval-and-compile
  (package-initialize))

(require 'cc-mode)
(require 'js2-mode)
(require 'sh-script)
(require 'markdown-mode)

;; Java indentation

(defconst edawg-java-style
  '((c-basic-offset . 2)
    (indent-tabs-mode . nil))
  "Java programming style.")

(defun edawg-set-java-style ()
  (interactive)
  (setq-local c-tab-always-indent t)
  (c-add-style "Edawg" edawg-java-style t))

(add-hook 'java-mode-hook 'edawg-set-java-style)

;; Use js2-mode for Javascript
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
(add-to-list 'auto-mode-alist '("\\.json\\'" . js2-mode))
(add-to-list 'auto-mode-alist '("\\.php\\'" . php-mode))

(add-hook 'js2-mode-hook
          (lambda ()
            (setq js2-basic-offset 2
                  js2-bounce-indent-p t)))

(add-hook 'prog-mode-hook
          (lambda ()
            (if (derived-mode-p 'ielm-mode 'lisp-mode 'scheme-mode
                                'emacs-lisp-mode)
                (paredit-mode))))

(setq sh-basic-offset 2)

(eval-after-load 'eldoc
  '(eldoc-add-command 'paredit-backward-delete 'paredit-close-round))

(add-hook 'emacs-lisp-mode-hook 'eldoc-mode)
(add-hook 'prog-mode-hook 'idle-highlight-mode)
