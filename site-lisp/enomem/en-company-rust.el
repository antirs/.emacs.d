;;; enomem/en-company
(use-package enomem/en-company :load-path "site-lisp"
  :after company
  :hook (rust-mode . company-mode))

(provide 'enomem/en-company-rust)
