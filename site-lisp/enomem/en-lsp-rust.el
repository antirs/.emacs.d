;;; enomem/en-lsp
(use-package enomem/en-lsp :load-path "site-lisp"
  :after lsp-origami
  :hook (rust-mode . enomem/en-lsp/rust-mode-setup)
  :config
  (lsp-origami-try-enable)
  :preface
  (defun enomem/en-lsp/rust-mode-setup ()
    (setq lsp-disabled-clients '(rls))
    (setq lsp-enabled-clients '(rust-analyzer))
    (lsp-deferred)))

;;; lsp-rust
(use-package lsp-rust
  :config
  (setq lsp-rust-racer-completion nil))

(provide 'enomem/en-lsp-rust)
