;;; enomem/en-lsp
(use-package enomem/en-lsp :load-path "site-lisp"
  :after lsp-mode
  :config
  (add-to-list 'lsp-language-id-configuration '(cwl-mode . "cwl"))
  (lsp-register-client
   (make-lsp-client :new-connection (lsp-stdio-connection '("benten-ls" "--mode" "stdio"))
                    :activation-fn (lsp-activate-on "cwl")
                    :major-modes '(cwl-mode)
                    :server-id 'cwlls))
  :hook (cwl-mode . en-lsp-cwl/cwl-mode-setup)
  :preface
  (defun en-lsp-cwl/cwl-mode-setup ()
    (setq lsp-enabled-clients '(cwlls))
    (lsp-deferred)))

(provide 'enomem/en-lsp-cwl)
