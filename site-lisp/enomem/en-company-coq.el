;;; enomem/en-company
(use-package enomem/en-company :load-path "site-lisp")

;;; company-coq
(use-package company-coq
  :config
  (prettify-symbols-mode -1)
  :hook (coq-mode . company-coq-mode)
  :bind (:map coq-mode-map
              ("M-s M-c c" . 'company-coq-clear-definition-overlay)
              ("M-s M-c s" . 'company-coq-toggle-definition-overlay)
              ("M-s M-c j" . 'company-coq-jump-to-definition)
              ("M-s M-c d" . 'company-coq-doc)
              ("M-s M-c g" . 'company-coq-grep-symbol)
              ("M-s M-c o" . 'company-coq-occur)
              ("M-s M-p" . 'prettify-symbols-mode)))

(provide 'enomem/en-company-coq)
