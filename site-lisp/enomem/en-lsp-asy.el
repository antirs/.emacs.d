;;; enomem/en-lsp
(use-package enomem/en-lsp :load-path "site-lisp"
  :after lsp-mode
  :config
  (add-to-list 'lsp-language-id-configuration '(asy-mode . "asymptote"))
  (lsp-register-client
   (make-lsp-client :new-connection (lsp-stdio-connection '("asy" "-lsp"))
                    :activation-fn (lsp-activate-on "asymptote")
                    :major-modes '(asy-mode)
                    :server-id 'asyls))
  :hook (asy-mode . en-lsp-asy/asy-mode-setup)
  :preface
  (defun en-lsp-asy/asy-mode-setup ()
    (setq lsp-enabled-clients '(asyls))
    (lsp-deferred)))

(provide 'enomem/en-lsp-asy)
