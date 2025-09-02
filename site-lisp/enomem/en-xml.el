;;; nxml-mode
(use-package nxml-mode
  :init
  (add-to-list 'hs-special-modes-alist
               '(nxml-mode
                 "<!--\\|<[^/>]*[^/]>"
                 "-->\\|</[^/>]*[^/]>"
                 "<!--"
                 sgml-skip-tag-forward
                 nil))
  :config
  (setq nxml-child-indent 4)
  (setq nxml-attribute-indent 4))

;;; enomem/en-lsp-xml
(use-package enomem/en-lsp-xml :load-path "site-lisp")

;;; enomem/en-fold
(use-package enomem/en-fold :load-path "site-lisp"
  :hook (nxml-mode . hs-minor-mode))

;;; enomem/en-edit
(use-package enomem/en-edit :load-path "site-lisp"
  :hook (nxml-mode . en-edit/nxml-mode-setup)
  :preface
  (defun en-edit/nxml-mode-setup ()
    (setq fill-column 120)
    (setq whitespace-style relaxed-space-whitespace-style)
    (setq whitespace-line-column 120)
    (en-edit/whitespace-mode-reload)))

(provide 'enomem/en-xml)
