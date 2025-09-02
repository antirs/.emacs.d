;;; asy
(use-package asy-mode :load-path "site-lisp/system/tex/asy"
  :mode ("\\.asy$" . asy-mode))

;;; cweb
(use-package cweb :load-path "site-lisp/system/tex/cweb")

;;; latex-cjk-common
(use-package cjk-enc :load-path "site-lisp/system/tex/latex-cjk-common" :no-require
  :commands cjk-write-file)
(use-package cjkspace :load-path "site-lisp/system/tex/latex-cjk-common" :no-require
  :commands CJK-insert-space)
(use-package cjktilde :load-path "site-lisp/system/tex/latex-cjk-common" :no-require
  :commands cjk-tilde-mode)

;;; ltx-help
(use-package ltx-help :load-path "site-lisp/system/tex")

(provide 'system/tex)
