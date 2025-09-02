;;; enomem/en-lsp
(use-package enomem/en-lsp :load-path "site-lisp"
  :hook (vala-mode . en-lsp-vala/vala-mode-setup)
  :preface
  (defun en-lsp-vala/vala-mode-setup ()
    (setq lsp-enabled-clients '(valals))
    (lsp-deferred)))

;;; lsp-pylsp
(use-package lsp-vala)

(provide 'enomem/en-lsp-vala)
