;;; ttl-mode
(use-package ttl-mode :load-path "site-lisp"
  :mode (("\\.ttl\\'" . ttl-mode)
         ("\\.n3\\'" . ttl-mode)
         ("\\.nt\\'" . ttl-mode)))

;;; tawny-mode
(use-package tawny-mode :load-path "site-lisp" :disabled)

(provide 'enomem/en-data)
