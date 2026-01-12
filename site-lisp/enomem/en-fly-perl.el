;;; enomem/en-fly
(use-package enomem/en-fly :load-path "site-lisp"
  :after flycheck
  :hook (perl-mode . flycheck-mode))

;;; flycheck-raku
(use-package flycheck-raku :load-path "site-lisp"
  :after flycheck
  :hook (raku-mode . flycheck-mode))

;;; flymake-rakudo
(use-package flymake-rakudo :load-path "site-lisp"
  :after flymake
  :hook (raku-mode . flymake-mode))

(provide 'enomem/en-fly-perl)
