;;; enomem/en-company
(use-package enomem/en-company :load-path "site-lisp"
  :after company
  :hook (gap-mode . company-mode))

;;; gap-company
(use-package gap-company
  :hook (gap-mode . gap-company/gap-mode-setup)
  :bind (:map gap-mode-map
              ("M-i M-g" . company-ansible))
  :preface
  (defun gap-company/gap-mode-setup ()
    (add-to-list 'company-backends 'company-gap-backend t)))

(provide 'enomem/en-company-gap)
