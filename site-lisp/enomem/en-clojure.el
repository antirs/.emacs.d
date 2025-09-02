;;; clojure-mode
(use-package clojure-mode
  :mode (("\\.cljs?\\'" . clojure-mode)))

;;; cider
(use-package cider
  :init
  (setq cider-injected-nrepl-version "0.8.3")
  (make-variable-buffer-local 'cider-required-middleware-version)
  :hook (clojure-mode . cider-mode))

;;; cider-repl
(use-package cider-repl)

;;; enomem/en-paredit
(use-package enomem/en-edit
  :after paredit
  :hook ((clojure-mode cider-repl-mode) . paredit-mode))

(provide 'enomem/en-clojure)
