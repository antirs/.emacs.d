;;; enomem/en-company
(use-package enomem/en-company :load-path "site-lisp"
  :after company
  :hook ((sh-mode shell-mode) . company-mode))

(provide 'enomem/en-company-shell)
