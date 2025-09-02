;;; enomem/en-lsp
(use-package enomem/en-lsp :load-path "site-lisp"
  :hook (jsonian-mode . en-lsp-json/json-mode-setup)
  :preface
  (defun en-lsp-json/json-mode-setup ()
    (setq lsp-enabled-clients '(json-ls))
    (lsp-deferred)))

;;; lsp-json
(use-package lsp-json
  :config
  (setq lsp-http-proxy "http://localhost:8080")
  (setq lsp-http-proxyStrictSSL nil)
  (setq lsp-json-schemas
        `[(:fileMatch ["valid_data.json"] :url "file:///home/enomem/code/remote/github.com/ajv-validator/ajv-cli/test/schema.json")]))

(provide 'enomem/en-lsp-json)
