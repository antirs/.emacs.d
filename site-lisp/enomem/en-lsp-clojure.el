;;; enomem/en-lsp
(use-package enomem/en-lsp :load-path "site-lisp")

;;; lsp-clojure
(use-package lsp-clojure
  :hook (clojure-mode . en-lsp/clojure-mode-setup)
  :preface
  (defun en-lsp/clojure-mode-setup ()
    (setq lsp-enabled-clients '(clojure-lsp))
    (lsp-deferred)))

(provide 'enomem/en-lsp-clojure)
