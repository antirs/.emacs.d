;;; dependencies
(use-package tex-site)

;;; emaxima
(use-package emaxima :load-path "site-lisp/system/math/maxima/emaxima"
  :after tex-site)

;;; imaxima
(use-package imaxima :load-path "site-lisp/system/math/maxima/imaxima")

;;; imath
(use-package imath :load-path "site-lisp/system/math/maxima/imaxima")

;;; misc
(use-package bookmode :load-path "site-lisp/system/math/maxima/misc" :disabled)

;;; singular
(use-package singular :load-path "site-lisp/system/math/singular"
  :commands singular
  :mode ("\\.\\(sing\\|lib\\)" . c++-mode))

(provide 'system/math)
