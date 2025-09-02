;;; enomem/en-lsp
(use-package enomem/en-lsp :load-path "site-lisp"
  :after lsp-origami
  :hook ((haskell-mode haskell-literate-mode) . en-lsp/haskell-mode-setup)
  :config
  (lsp-origami-try-enable)
  :preface
  (defun en-lsp/haskell-mode-setup ()
    (setq lsp-enabled-clients '(lsp-haskell))
    (lsp-deferred)))

;;; lsp-haskell
(use-package lsp-haskell
  :config
  (setq lsp-haskell-server-path
        "/home/enomem/.ghcup/bin/haskell-language-server-8.10.7~1.9.0.0"))

(provide 'enomem/en-lsp-haskell)
