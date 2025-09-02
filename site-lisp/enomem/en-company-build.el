;;; enomem/en-company
(use-package enomem/en-company :load-path "site-lisp"
  :after company
  :hook ((cmake-mode meson-mode) . company-mode))

(provide 'enomem/en-company-build)
