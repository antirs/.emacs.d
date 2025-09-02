;;; enomem/en-fly
(use-package enomem/en-fly :load-path "site-lisp"
  :after flycheck
  :hook (tcl-mode . flycheck-mode))

;;; flycheck-tcl
(use-package flycheck-tcl
  :config
  (flycheck-tcl-setup))


(provide 'enomem/en-fly-tcl)
