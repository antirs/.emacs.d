;;; autoconf-mode
(use-package autoconf-mode :load-path "site-lisp/system/build/autoconf"
  :mode ("\\.ac\\'\\|configure\\.in\\'" . autoconf-mode))

;;; autotest-mode
(use-package autotest-mode :load-path "site-lisp/system/build/autoconf"
  :mode ("\\.at\\'" . autotest-mode))

;;; start-po
(use-package start-po :load-path "site-lisp/system/build/gettext-0.21.1" :no-require
  :mode ("\\.po\\'\\|\\.po\\." . po-mode))

(provide 'system/build)
