;;; enomem/en-lsp
(use-package enomem/en-lsp :load-path "site-lisp" :disabled
  :hook (org-mode . lsp-org))

(provide 'enomem/en-lsp-org)
