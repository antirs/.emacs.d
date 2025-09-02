;;; dependencies
(use-package request)

;;; reverso
(use-package reverso :load-path "site-lisp/system/dict/reverso"
  :after request)

(provide 'system/dict)
