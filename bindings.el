;; Bindings

(global-set-key (kbd "M-/") 'hippie-expand)
(global-set-key (kbd "C-x C-b") 'ibuffer)

(global-set-key (kbd "C-s") 'isearch-forward-regexp)
(global-set-key (kbd "C-r") 'isearch-backward-regexp)
(global-set-key (kbd "C-M-s") 'isearch-forward)
(global-set-key (kbd "C-M-r") 'isearch-backward)

(global-set-key (kbd "C-x g") 'magit-status)
(global-set-key (kbd "C-x w") 'delete-trailing-whitespace)

;; God mode
(global-set-key (kbd "<escape>") 'god-local-mode)
(provide 'bindings)
