;;; enomem/en-fly
(use-package enomem/en-fly :load-path "site-lisp"
  :after flycheck)

;;; flycheck-clang-tide
(use-package flycheck-clang-tidy
  :hook (flycheck-mode . flycheck-clang-tidy-setup))

;;; flycheck-rtags
(use-package flycheck-rtags)

;;; flycheck-irony
(use-package flycheck-irony
  :hook (flycheck-mode . flycheck-irony-setup))

(provide 'enomem/en-fly-c++)
