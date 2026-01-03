;;; enh-ruby-mode
(use-package enh-ruby-mode :disabled
  :mode ("\\.rb\\'" . enh-ruby-mode))

;;; rvm
(use-package rvm)

;;; enomem/en-lsp-ruby
(use-package enomem/en-lsp-ruby :load-path "site-lisp")

(provide 'enomem/en-ruby)
