;;; enomem/en-fly
(use-package enomem/en-fly :load-path "site-lisp"
  :after flycheck
  :hook (haskell-mode . flycheck-mode))

;;; flycheck-haskell
(use-package flycheck-haskell
  :hook (haskell-mode . flycheck-haskell-configure))

(provide 'enomem/en-fly-haskell)
