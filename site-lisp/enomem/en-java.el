;;; cc-mode
(use-package cc-mode
  :hook (java-mode . cc-mode/java-mode-setup)
  :preface
  (defun cc-mode/java-mode-setup ()
    (setq c-block-comment-prefix "* ")))

;;; groovy-mode
(use-package groovy-mode)

;;; enomem/en-tags
(use-package enomem/en-tags :load-path "site-lisp"
  :hook (java-mode . cscope-minor-mode)
  :hook (java-mode . ggtags-mode)
  :hook (java-mode . enomem/en-tags/java-mode-setup)
  :preface
  (defun enomem/en-tags/java-mode-setup ()
    (setenv "GTAGSLIBPATH" "/home/enomem/.tags.d/java")))

;;; enomem/en-company-java
(use-package enomem/en-company-java :load-path "site-lisp")

;;; enomem/en-fly-java
(use-package enomem/en-fly-java :load-path "site-lisp")

;;; enomem/en-lsp-java
(use-package enomem/en-lsp-java :load-path "site-lisp")

;;; enomem/en-dap-java
(use-package enomem/en-dap-java :load-path "site-lisp")

;;; enomem/en-edit
(use-package enomem/en-edit :load-path "site-lisp"
  :hook (java-mode . en-edit/java-mode-setup)
  :preface
  (defun en-edit/java-mode-setup ()
    (setq whitespace-style relaxed-space-whitespace-style)
    (en-edit/whitespace-mode-reload)))

(provide 'enomem/en-java)
