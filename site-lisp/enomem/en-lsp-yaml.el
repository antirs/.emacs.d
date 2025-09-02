;;; enomem/en-lsp
(use-package enomem/en-lsp :load-path "site-lisp"
  :config
  ;; (add-to-list 'lsp-language-id-configuration '(cwl-mode . "yaml"))
  ;; :hook (cwl-mode . en-lsp-yaml/yaml-mode-setup)
  :hook (yaml-mode . en-lsp-yaml/yaml-mode-setup)
  :preface
  (defun en-lsp-yaml/yaml-mode-setup ()
    (setq lsp-enabled-clients '(yamlls))
    (lsp-deferred)))

;;; lsp-yaml
(use-package lsp-yaml
  :init
  (setq lsp-yaml-schema-store-local-db "/home/enomem/.emacs.d/.cache/lsp/npm/lsp-yaml-schemas.json")
  ;; (setq lsp-yaml-schemas '((enomem__schema.json . ["./json-schema.yaml"])))
  :config
  (push 'cwl-mode
        (lsp--client-major-modes (gethash 'yamlls lsp-clients)))
  (setq lsp-yaml-schema-store-uri "http://localhost:8080/www.schemastore.org/api/json/catalog.json"))

(provide 'enomem/en-lsp-yaml)
