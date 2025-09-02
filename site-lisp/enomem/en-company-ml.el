;;; enomem/en-company
(use-package enomem/en-company :load-path "site-lisp"
  :after company
  :hook ((caml-mode tuareg-mode tuareg-interactive-mode) . company-mode))

(provide 'enomem/en-company-ml)
