;;; enomem/en-dap
(use-package enomem/en-dap :load-path "site-lisp")

;;; dap-java
(use-package dap-java
  :init
  (setq dap-java-default-debug-port 41044))

(provide 'enomem/en-dap-java)
