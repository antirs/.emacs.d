;;; enomem/en-company
(use-package enomem/en-company :load-path "site-lisp"
  :after company
  :hook ((emacs-lisp-mode inferior-emacs-lisp-mode) . company-mode))

(provide 'enomem/en-company-elisp)
