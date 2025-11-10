;;; enomem/en-fly
(use-package enomem/en-fly :load-path "site-lisp"
  :after flycheck
  :hook (perl-mode . flycheck-mode))

(provide 'enomem/en-fly-perl)
