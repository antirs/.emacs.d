;;; go-mode
(use-package go-mode
  :mode ("\\.rego\\'" . go-mode))

;;; go-dlv
(use-package go-dlv :load-path "site-lisp")

;;; enomem/en-company-go
(use-package enomem/en-company-go :load-path "site-lisp")

;;; enomem/en-lsp-go
(use-package enomem/en-lsp-go :load-path "site-lisp")

;;; enomem/en-edit
(use-package enomem/en-edit :load-path "site-lisp"
  :hook (go-mode . en-edit/go-mode-setup)
  :preface
  (defun en-edit/go-mode-setup ()
    (setq indent-tabs-mode t)
    (setq whitespace-style tab-whitespace-style)
    (en-edit/whitespace-mode-reload)))

;;; enomem/en-emacs
(use-package enomem/en-emacs :load-path "site-lisp"
  :after window-purpose
  :config
  (add-to-list 'purpose-user-mode-purposes '(go-mode . go))
  (purpose-compile-user-configuration))

(provide 'enomem/en-go)
