;;; system/lisp
(use-package system/lisp :load-path "site-lisp"
  :config
  (use-package clhs
    :bind (:map enomem-mode-map
                ("M-g M-d h" . hyperspec-lookup))))

;;; lisp-mode
(use-package lisp-mode
  :config
  (setq inferior-lisp-program "/usr/bin/sbcl")
  (setq common-lisp-hyperspec-root
        "file:///home/enomem/docs/hyperspec-docs/HyperSpec/")
  :bind (:map lisp-mode-map
              ("M-g M-d h" . hyperspec-lookup)))

;;; slime
(use-package slime
  :config
  (setq slime-contribs '(slime-fancy slime-asdf))
  (setq slime-lisp-host "localhost")
  :bind (:map enomem-mode-map
              ("M-i M-l" . slime))
  :bind (:map slime-mode-map
              ("M-g M-d h" . hyperspec-lookup)
              ("M-s e c" . slime-connect)
              ("M-s e a" . 'slime-abort-connection)
              ("M-s e 1" . slime-macroexpand-1)
              ("M-s e a" . slime-macroexpand-all))
  :hook (lisp-mode . slime-mode))

;;; slime-repl
(use-package slime-repl
  :commands slime
  :bind (:map slime-repl-mode-map
              ;; prefixes
              ("M-r" . nil)
              ("M-s" . nil)
              ;; keys
              ("M-r s" . nil)
              ("M-g M-d h" . hyperspec-lookup)
              ("M-s e a" . slime-macroexpand-all)
              ("M-s e 1" . slime-macroexpand-1)))

;;; enomem/en-company-scheme
(use-package enomem/en-company-scheme :load-path "site-lisp")

;;; enomem/en-fly
(use-package enomem/en-fly :load-path "site-lisp"
  :hook (lisp-mode . flycheck-mode))

;;; enomem/en-edit
(use-package enomem/en-edit :load-path "site-lisp"
  :after paredit
  :hook (lisp-mode . en-edit/lisp-mode-setup)
  :hook (lisp-data-mode . en-edit/lisp-data-mode-setup)
  :hook (lisp-mode . paredit-mode)
  :hook (lisp-data-mode . paredit-mode)
  :preface
  (defun en-edit/lisp-data-mode-setup ()
    (setq whitespace-style relaxed-space-whitespace-style)
    (en-edit/whitespace-mode-reload))
  (defun en-edit/lisp-mode-setup ()
    (setq whitespace-style space-whitespace-style)
    (en-edit/whitespace-mode-reload)))

;;; enomem/en-emacs
(use-package enomem/en-emacs :load-path "site-lisp"
  :after window-purpose
  :config
  (add-to-list 'purpose-user-mode-purposes '(lisp-mode . lisp))
  (add-to-list 'purpose-user-mode-purposes '(sldb-mode . lisp+stack))
  (add-to-list 'purpose-user-mode-purposes '(slime-repl-mode . lisp+repl))
  (purpose-compile-user-configuration))

(provide 'enomem/en-lisp)
