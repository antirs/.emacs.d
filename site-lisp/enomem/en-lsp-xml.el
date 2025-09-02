;;; enomem/en-lsp
(use-package enomem/en-lsp :load-path "site-lisp"
  :hook (nxml-mode . en-lsp-xml/nxml-mode-setup)
  :preface
  (defun en-lsp-xml/nxml-mode-setup ()
    (setq lsp-enabled-clients '(xmlls semgrep-ls))
    (lsp-deferred)))

;;; lsp-xml
(use-package lsp-xml)

(provide 'enomem/en-lsp-xml)
