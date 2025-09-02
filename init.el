;; init.el --- enomem's config
;;
;;; Commentary:
;;                                i tak soidet
;;
;;; Code:

;;; elpa
(setq package-archives
      '(("local" . "/home/enomem/.emacs.d/.packages")))

(setq package-check-signature nil)
(package-initialize)

;;; use-package
(require 'use-package)

;;; enomem/en
(use-package enomem/en :load-path "site-lisp" :demand
  :hook (after-init . enomem-mode))

(use-package system/system :load-path "site-lisp")

(use-package enomem/en-mail :load-path "site-lisp" :demand)

(provide 'init.el)

;;; init.el ends here
