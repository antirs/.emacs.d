;;; enomem/en-company
(use-package enomem/en-company :load-path "site-lisp"
  :after company
  :hook ((js-mode js-jsx-mode typescript-mode) . company-mode))

(provide 'enomem/en-company-js)
