;;; enomem/en-lsp
(use-package enomem/en-lsp :load-path "site-lisp"
  :hook (lua-mode . en-lsp-lua/lua-mode-setup)
  :preface
  (defun en-lsp-lua/lua-mode-setup ()
    (setq lsp-disabled-clients '(lsp-emmy-lua lua-roblox-language-server))
    (setq lsp-enabled-clients '(lua-language-server))
    (lsp-deferred)))

;;; lsp-lua
(use-package lsp-lua)

(provide 'enomem/en-lsp-lua)
