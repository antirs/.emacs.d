;;; enomem/en-company
(use-package enomem/en-company :load-path "site-lisp"
  :after company
  :hook (python-mode . company-mode))

;;; company-anaconda
(use-package company-anaconda
  :hook (anaconda-mode . company-anaconda/company-anaconda-setup)
  :bind (:map anaconda-mode-map
              ("M-i M-a" . company-anaconda))
  :preface
  (defun company-anaconda/company-anaconda-setup ()
    (add-to-list 'company-backends 'company-anaconda t)))

(provide 'enomem/en-company-python)
