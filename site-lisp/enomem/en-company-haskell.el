;;; enomem/en-company
(use-package enomem/en-company :load-path "site-lisp"
  :after company
  :hook (haskell-mode . company-mode))

;;; dante
(use-package dante
  :after company
  :hook (dante-mode . dante/company-mode-setup)
  :bind (:map company-mode-map
              ("M-i M-d" . dante-company))
  :preface
  (defun dante/company-mode-setup ()
    (setq company-backends (delete 'dante-company company-backends))
    (add-to-list 'company-backends 'dante-company t)))

(provide 'enomem/en-company-haskell)
