;;; acl2
(use-package emacs-acl2 :load-path "site-lisp/system/proof/acl2" :no-require
  :mode ("\\.acl2$" . acl2-mode))
(use-package inf-acl2 :load-path "site-lisp/system/proof/acl2")
(use-package acl2-doc :load-path "site-lisp/system/proof/acl2" :no-require
  :commands acl2-doc)

;;; why3
(use-package why3 :load-path "site-lisp/system/proof/why3"
  :mode ("\\.\\(why\\|mlw\\)$" . why3-mode)
  :hook (why3-mode . system/proof/why3-mode-setup)
  :preface
  (defun system/proof/why3-mode-setup ()
    (setq indent-line-function 'why3-indent-line)))

;;; frama-c
(use-package acsl :load-path "site-lisp/system/proof/frama-c" :no-require
  :autoload acsl-mode)

;;; twelf
(use-package twelf-init :load-path "site-lisp/system/proof/twelf" :no-require
  :mode ("\\.\\(elf\\|quy\\)$" . twelf-mode))

(provide 'system/proof)
