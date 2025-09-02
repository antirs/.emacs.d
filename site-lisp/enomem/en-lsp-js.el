;;; enomem/en-lsp
(use-package enomem/en-lsp :load-path "site-lisp"
  :config
  :hook ((js-mode js-jsx-mode typescript-mode) . en-lsp-js/js-mode-setup)
  :preface
  (defun en-lsp-js/js-mode-setup ()
    (if (not (member major-mode '(json-mode)))
        (progn (setq lsp-enabled-clients '(ts-ls))
               (lsp-deferred)))))

;;; lsp-javascript
(use-package lsp-javascript
  :config
  (setq lsp-javascript-format-enable nil)
  (setq lsp-javascript-suggest-enabled nil)
  (setq lsp-javascript-validate-enable t))

(provide 'enomem/en-lsp-js)
