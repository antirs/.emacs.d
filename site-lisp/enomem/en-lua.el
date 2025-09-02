;;; lua-mode
(use-package lua-mode
  :config
  (setq lua-default-application "luajit")
  (setq tab-width 3)
  (setq lua-indent-level 3)
  (setq lua-indent-level 3))

;;; enomem/en-lsp-lua
(use-package enomem/en-lsp-lua :load-path "site-lisp")

(provide 'enomem/en-lua)
