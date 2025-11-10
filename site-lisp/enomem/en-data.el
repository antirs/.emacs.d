;;; ttl-mode
(use-package ttl-mode :load-path "site-lisp"
  :mode (("\\.ttl\\'" . ttl-mode)
         ("\\.n3\\'" . ttl-mode)
         ("\\.nt\\'" . ttl-mode)))

;;; tawny-mode
(use-package tawny-mode :load-path "site-lisp" :disabled)

;;; sparql-mode
(use-package sparql-mode :load-path "site-lisp"
  :mode (("\\.sparql\\|\\.rq\\|\\.ru\\'" . sparql-mode)))

;;; enomem/en-fold
(use-package enomem/en-fold :load-path "site-lisp"
  :hook (ttl-mode . origami-mode))

(provide 'enomem/en-data)
