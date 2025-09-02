;;; sql
(use-package sql
  :mode ("\\.psql\\'" . sql-mode)
  :config
  (sql-highlight-postgres-keywords))

;;; sql-upcase
(use-package sql-upcase :load-path "site-lisp/enomem/scripts"
  :hook (sql-mode . sql-upcase-mode))

;;; emacsql
(use-package emacsql)

;;; emacsql-sqlite
(use-package emacsql-sqlite :disabled)

(provide 'enomem/en-db)
