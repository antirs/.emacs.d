;;; SuperCollider
(use-package sclang :load-path "site-lisp/system/art/SuperCollider"
  :mode ("\\.scd?\\'" . sclang-mode)
  :mode ("\\.schelp\\'" . sclang-help-minor-mode))

(provide 'system/art)
