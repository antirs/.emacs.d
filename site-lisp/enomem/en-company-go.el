;;; enomem/en-company
(use-package enomem/en-company :load-path "site-lisp"
  :after company
  :hook (go-mode . company-mode)
  :hook (go-mode . en-company/go-mode-setup)
  :preface
  (defun en-company/go-mode-setup ()
    (add-to-list 'company-backends 'company-go t)))

;;; company-go
(use-package company-go
  :bind (:map go-mode-map
              ("M-i M-g" . company-go)))

(provide 'enomem/en-company-go)
