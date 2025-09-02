;;; enomem/en-company
(use-package enomem/en-company :load-path "site-lisp"
  :after company
  :hook (java-mode . company-mode))

(provide 'enomem/en-company-java)
