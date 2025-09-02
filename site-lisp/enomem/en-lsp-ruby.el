;;; enomem/en-lsp
(use-package enomem/en-lsp :load-path "site-lisp"
  :hook ((ruby-mode enh-ruby-mode) . en-lsp/ruby-mode-setup)
  :preface
  (defun en-lsp/ruby-mode-setup ()
    (setq lsp-enabled-clients '(ruby-ls steep-ls))
    (setq lsp-disabled-clients '(ruby-lsp))
    (lsp-deferred)))

;;; lsp-solargraph
(use-package lsp-solargraph)

;;; enomem/en-dap
;; (use-package enomem/en-dap :load-path "site-lisp")

;;; dap-ruby
;; (use-package dap-ruby :load-path "site-lisp")

(provide 'enomem/en-lsp-ruby)
