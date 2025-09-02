;;; enomem/en-company
(use-package enomem/en-company :load-path "site-lisp"
  :after company
  :hook ((c-mode c++-mode) . company-mode))

;;; company-rtags
(use-package company-rtags
  :hook ((c-mode c++-mode) . company-rtags/company-rtags-setup)
  :bind (:map c-mode-base-map
              ("M-i M-r" . company-rtags))
  :preface
  (defun company-rtags/company-rtags-setup ()
    (add-to-list 'company-backends 'company-rtags t)))

;;; company-irony
(use-package company-irony :disabled
  :hook ((c-mode c++-mode) . company-irony/company-irony-setup)
  :bind (:map c-mode-base-map
              ("M-i M-o" . company-irony))
  :preface
  (defun company-irony/company-irony-setup ()
    (add-to-list 'company-backends 'company-irony t)))

;;; company-c-headers
(use-package company-c-headers
  :bind (:map c-mode-base-map
              ("M-i M-h" . company-c-headers)))

(provide 'enomem/en-company-c++)
