;;; languages.el --- configuration for various programming languages 

;; Java indentation

(defconst edawg-java-style
  '((c-basic-offset . 2)
    (indent-tabs-mode . nil))
  "Java programming style.")

(defun edawg-set-java-style ()
  (interactive)
  (setq-local c-tab-always-indent t)
  (c-add-style "Edawg" edawg-java-style t))

(add-hook 'java-mode-hook #'edawg-set-java-style)

;; Use js2-mode for Javascript
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
(add-to-list 'auto-mode-alist '("\\.php\\'" . php-mode))

(add-hook 'js2-mode-hook
          '(lambda ()
             (setq js2-basic-offset 2
                   js2-bounce-indent-p t)))

(dolist (hook '(emacs-lisp-mode-hook
                ielm-mode-hook
                lisp-mode-hook
                scheme-mode-hook))
  (add-hook hook 'paredit-mode))

(eval-after-load 'eldoc
  '(eldoc-add-command 'paredit-backward-delete 'paredit-close-round))

(add-hook 'emacs-lisp-mode-hook 'eldoc-mode)
(add-hook 'prog-mode-hook 'idle-highlight-mode)
