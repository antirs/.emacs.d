;;; enomem/en-lsp
(use-package enomem/en-lsp :load-path "site-lisp"
  :config
  :hook (sh-mode . en-lsp-shell/sh-mode-setup)
  :preface
  (defun en-lsp-shell/sh-mode-setup ()
    (setq lsp-disabled-clients '(copilot-ls bash-ls))
    (lsp-deferred)))

;;; lsp-bash
(use-package lsp-bash)

(provide 'enomem/en-lsp-shell)
