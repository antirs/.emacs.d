;;; enomem/en-dap
(use-package enomem/en-dap :load-path "site-lisp")

;;; dap-python
(use-package dap-python
  :config
  (setq dap-python-terminal "rxvt-unicode -hold -e "))

(provide 'enomem/en-dap-python)
