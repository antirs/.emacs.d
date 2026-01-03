;;; enomem/en-lsp
(use-package enomem/en-lsp :load-path "site-lisp"
  :after lsp-mode
  :mode ("\\.pl\\'" . prolog-mode)
  :config
  (add-to-list 'lsp-language-id-configuration '(prolog-mode . "prolog"))
  :hook (prolog-mode . en-lsp/prolog-mode-setup)
  :preface
  (defun en-lsp/prolog-mode-setup ()
    (setq lsp-enabled-clients '(prolog-lsp))
    (lsp-deferred)))

;;; lsp-prolog
(use-package lsp-prolog)

(provide 'enomem/en-lsp-prolog)
