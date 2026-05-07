;;; enomem/en-lsp
(use-package enomem/en-lsp :load-path "site-lisp"
  :after lsp-mode
  :config
  (add-to-list 'lsp-language-id-configuration '(tcl-mode . "tcl"))
  (lsp-register-client
   (make-lsp-client :new-connection (lsp-stdio-connection '("lsp.tcl"))
                    :activation-fn (lsp-activate-on "tcl")
                    :major-modes '(tcl-mode)
                    :server-id 'lsptcl))
  :hook (tcl-mode . en-lsp-tcl/tcl-mode-setup)
  :preface
  (defun en-lsp-tcl/tcl-mode-setup ()
    (setq lsp-enabled-clients '(lsptcl))
    (lsp-deferred)))

(provide 'enomem/en-lsp-tcl)
