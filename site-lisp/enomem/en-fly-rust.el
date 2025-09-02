;;; enomem/en-fly
(use-package enomem/en-fly :load-path "site-lisp"
  :after flycheck
  :hook (rust-mode . flycheck-mode))

;;; flycheck-rust
(use-package flycheck-rust
  :config
  (flycheck-rust-setup))

(provide 'enomem/en-fly-rust)
