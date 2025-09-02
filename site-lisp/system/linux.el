;;; dependencies
(use-package flycheck)

;;; ebuild-mode
(use-package devbook-mode :load-path "site-lisp/system/linux/ebuild-mode")
(use-package ebuild-mode :load-path "site-lisp/system/linux/ebuild-mode")
(use-package gentoo-newsitem-mode :load-path "site-lisp/system/linux/ebuild-mode")
(use-package glep-mode :load-path "site-lisp/system/linux/ebuild-mode")

;;; eselect-mode
(use-package eselect-mode :load-path "site-lisp/system/linux/eselect-mode")

;;; pkgcheck
(use-package flycheck-pkgcheck :load-path "site-lisp/system/linux/pkgcheck"
  :after flycheck)

;;; rpm-spec-mode
(use-package rpm-spec-mode :load-path "site-lisp/system/linux/rpm-spec-mode")

;;; systemtap-mode
(use-package systemtap-init :load-path "site-lisp/system/linux/systemtap-mode" :no-require
  :mode ("\\.stpm?$" . systemtap-mode))

;;; desktop-entry-mode
(use-package selinux-policy :load-path "site-lisp/system/linux/selinux"
  :mode (("\\.if$" . selinuxpolicy-mode)
         ("\\.fc$" . selinuxpolicy-mode)
         ("\\.spt$" . selinuxpolicy-mode)
         ("\\.te$" . selinuxpolicy-mode)))

;;; desktop-entry-mode
(use-package desktop-entry-mode :load-path "site-lisp/system/linux/desktop-entry-mode")

(provide 'system/linux)
