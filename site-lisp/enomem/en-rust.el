;;; rust-mode
(use-package rust-mode
  :bind (:map rust-mode-map
              ("M-s M-f b" . rust-format-buffer)))

;; cargo
(use-package cargo
  :hook (rust-mode . cargo-minor-mode))

;;; racer
(use-package racer :disabled
  :config
  (setq racer-cmd "~/.cargo/bin/racer")
  (setq racer-rust-src-path "~/code/remote/github.com/rust-lang/rust/library"))

;;; enomem/en-company-rust
(use-package enomem/en-company-rust :load-path "site-lisp")

;;; enomem/en-fly-haskell
(use-package enomem/en-fly-rust :load-path "site-lisp")

;;; enomem/en-lsp-rust
(use-package enomem/en-lsp-rust :load-path "site-lisp")

;;; enomem/en-fold
(use-package enomem/en-fold :load-path "site-lisp"
  :hook (rust-mode . origami-mode))

;;; enomem/en-edit
(use-package enomem/en-edit :load-path "site-lisp"
  :hook (rust-mode . en-edit/rust-mode-setup)
  :preface
  (defun en-edit/rust-mode-setup ()
    (setq tab-width 4)
    (setq whitespace-style space-whitespace-style)
    (en-edit/whitespace-mode-reload)))

(provide 'enomem/en-rust)
