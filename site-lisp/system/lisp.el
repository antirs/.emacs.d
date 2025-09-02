;;; clisp
(use-package clisp-indent :load-path "site-lisp/system/lisp/clisp" :disabled)

;;; clhs
(use-package clhs :load-path "site-lisp/system/lisp")

;;; dbl
(use-package dbl :load-path "site-lisp/system/lisp/gcl" :no-require
  :commands dbl)

;;; sshell
(use-package sshell :load-path "site-lisp/system/lisp/gcl")

(provide 'system/lisp)
