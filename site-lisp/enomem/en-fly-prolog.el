;;; enomem/en-fly
(use-package enomem/en-fly :load-path "site-lisp"
  :after flycheck
  :hook (prolog-mode . flymake-mode))

(use-package flymake-swi-prolog)

(provide 'enomem/en-fly-prolog)
