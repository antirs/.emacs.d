;;; shaclc-mode
(use-package shaclc-mode :load-path "site-lisp/system/data/shaclc-mode"
  :mode ("\\.shaclc?$" . shaclc-mode))

(use-package shexc-mode :load-path "site-lisp/system/data/shexc-mode-for-emacs"
  :no-require
  :mode ("\\.shexc?$" . shexc-mode))

(provide 'system/data)
