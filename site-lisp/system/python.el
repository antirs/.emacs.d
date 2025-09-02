;;; cython-mode
(use-package cython-mode :load-path "site-lisp/system/python"
  :mode ("\\.\\(pyx\\|pxd\\|pxi\\)" . cython-mode))

;;; pylookup
(use-package pylookup :load-path "site-lisp/system/python/pylookup")

(provide 'system/python)
