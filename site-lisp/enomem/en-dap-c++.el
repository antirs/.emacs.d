;;; enomem/en-dap
(use-package enomem/en-dap :load-path "site-lisp"
  :config
  :hook ((c-mode c++-mode) . dap-mode))

;;; dap-gdb-lldb
(use-package dap-gdb-lldb)

(provide 'enomem/en-dap-c++)
