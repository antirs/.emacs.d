;;; enomem/en-company
(use-package enomem/en-company :load-path "site-lisp"
  :after company
  :hook ((scheme-mode racket-mode geiser-repl-mode racket-repl-mode) . company-mode))

(provide 'enomem/en-company-scheme)
