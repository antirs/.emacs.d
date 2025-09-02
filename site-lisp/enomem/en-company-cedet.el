;;; enomem/en-company
(use-package enomem/en-company :load-path "site-lisp"
  :after company
  :hook (semantic-mode . company-mode))

;;; company-semantic
(use-package company-semantic :disabled
  :bind (:map company-mode-map
              ("M-i M-v" . company-semantic)))

(provide 'enomem/en-company-cedet)
