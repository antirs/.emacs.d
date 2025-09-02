;;; anything
(use-package anything :load-path "site-lisp/enomem/scripts" :disabled)

;;; atom2rss
(use-package atom2rss :load-path "site-lisp/enomem/scripts")

;;; editline
(use-package editline :load-path "site-lisp/enomem/scripts")

;;; go-template-mode
(use-package go-template-mode :load-path "site-lisp/enomem/scripts")

;;; hexldiff
(use-package hexldiff :load-path "site-lisp/enomem/scripts")

;;; hexview-mode
(use-package hexview-mode :load-path "site-lisp/enomem/scripts")

;;; highlight
(use-package highlight :load-path "site-lisp/enomem/scripts")

;;; ob-sclang
(use-package ob-sclang :load-path "site-lisp/enomem/scripts" :no-require)

;;; perl-completion
(use-package perl-completion :load-path "site-lisp/enomem/scripts")

;;; position-to-kill-ring
(use-package position-to-kill-ring :load-path "site-lisp/enomem/scripts"
  :bind (:map enomem-mode-map
              ("M-u M-e M-s" . 'sort-tags)))

;;; r2pipe
(use-package r2pipe :load-path "site-lisp/enomem/scripts")

;;; sort-one-line
(use-package sort-one-line :load-path "site-lisp/enomem/scripts"
  :bind (:map enomem-mode-map
              ("M-u M-e M-s" . 'sort-tags)))

;;; sql-upcase
(use-package sql-upcase :load-path "site-lisp/enomem/scripts")

;;; ttypaste
(use-package ttypaste :load-path "site-lisp/enomem/scripts")

;;; xpaste
(use-package xpaste :load-path "site-lisp/enomem/scripts")

(provide 'enomem/en-scripts)
