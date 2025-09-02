;;; enomem/en-lsp
(use-package enomem/en-lsp :load-path "site-lisp"
  :hook (go-mode . en-lsp/go-mode-setup)
  :preface
  (defun en-lsp/go-mode-setup ()
    (setq lsp-enabled-clients '(gopls))
    (lsp-deferred)))

;;; lsp-go
(use-package lsp-go)

(provide 'enomem/en-lsp-go)
