;;; enomem/en-company
(use-package enomem/en-company :load-path "site-lisp"
  :after company
  :hook (ansible . company-mode))

;;; company-ansible
(use-package company-ansible
  :hook (ansible . company-ansible/company-ansible-setup)
  :bind (:map yaml-mode-map
              ("M-i M-a" . company-ansible))
  :preface
  (defun company-ansible/company-ansible-setup ()
    (add-to-list 'company-backends 'company-ansible t)))

(provide 'enomem/en-company-ansible)
