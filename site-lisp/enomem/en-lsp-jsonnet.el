;;; enomem/en-lsp
(use-package enomem/en-lsp :load-path "site-lisp"
  :after lsp-mode
  :config
  (add-to-list 'lsp-language-id-configuration '(jsonnet-mode . "jsonnet-lsp"))
  (lsp-register-client
   (make-lsp-client :new-connection (lsp-stdio-connection '("jsonnet-language-server" "-t"))
                    :activation-fn (lsp-activate-on "jsonnet-lsp")
                    :major-modes '(jsonnet-mode)
                    :server-id 'jsonnet-lsp))
  :hook (jsonnet-mode . en-lsp-jsonnet/jsonnet-mode-setup)
  :preface
  (defun en-lsp-jsonnet/jsonnet-mode-setup ()
    (setq lsp-enabled-clients '(jsonnet-lsp))
    (lsp-deferred)))

(provide 'enomem/en-lsp-jsonnet)
