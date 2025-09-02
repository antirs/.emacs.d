;;; ansible
(use-package ansible)

;;; ansible-doc
(use-package ansible-doc
  :hook (ansible . ansible-doc-mode))

;;; poly-ansible
(use-package poly-ansible)

;;; jenkinsfile-mode
(use-package jenkinsfile-mode)

;;; enomem/en-company-ansible
(use-package enomem/en-company-ansible :load-path "site-lisp")

;;; enomem/en-edit
(use-package enomem/en-edit :load-path "site-lisp"
  :hook (ansible . en-edit/ansible-mode-setup)
  :preface
  (defun en-edit/ansible-mode-setup ()
    (setq tab-width 2)
    (setq whitespace-style relaxed-space-whitespace-style)
    (en-edit/whitespace-mode-reload)))

(provide 'enomem/en-devops)
