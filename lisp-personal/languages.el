(defconst edawg-java-style
  '((c-basic-offset . 2)
    (indent-tabs-mode . nil))
  "Java programming style.")

(defun edawg-set-java-style ()
  (interactive)
  (setq-local c-tab-always-indent t)
  (c-add-style "Edawg" edawg-java-style t))

(add-hook 'java-mode-hook #'edawg-set-java-style)

(autoload 'js2-mode "js2-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))

(add-hook 'js2-mode-hook
          #'(lambda ()
              (setq js2-basic-offset 2
                    js2-bounce-indent-p t)))

;; Add paredit to hooks
(dolist (hook '(emacs-lisp-mode-hook
                eval-expression-minibuffer-setup-hook
                ielm-mode-hook
                lisp-mode-hook
                lisp-interaction-mode-hook
                scheme-mode-hook))
  (add-hook hook #'enable-paredit-mode))

(eval-after-load 'eldoc
  '(eldoc-add-command 'paredit-backward-delete 'paredit-close-round))

(dolist (hook '(emacs-lisp-mode-hook
                lisp-interaction-mode-hook))
  (add-hook hook #'turn-on-eldoc-mode))

(provide 'languages)
