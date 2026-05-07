;;; system/scheme
(use-package system/scheme :load-path "site-lisp"
  :config
  (use-package cmuscheme48
    :bind (:map scheme-mode-map
                ("M-i M-S s" . 'scheme48-send-last-sexp)
                ("M-i M-S d" . 'scheme48-send-definition)
                ("M-i M-S D" . 'scheme48-send-definition-and-go)
                ("M-i M-S r" . 'scheme48-send-region)
                ("M-i M-S R" . 'scheme48-send-region-and-go)
                ("M-i M-S f" . 'scheme48-load-file)))
  (use-package gambit
    :bind (:map scheme-mode-map
                ("M-i M-G r" . 'run-gambit)
                ("M-i M-G f" . 'gambit-compile-file))))

;;; scheme-mode
(use-package scheme
  :config
  (setq scheme-program-name "scheme48")
  :bind (:map scheme-mode-map
              ("M-i c R" . 'run-scheme)
              ("M-i c r" . 'scheme-compile-region)
              ("M-i c d" . 'scheme-compile-definition)
              ("M-i c f" . 'scheme-compile-file)
              ("M-i c r" . 'scheme-compile-region)
              ("M-i s d" . 'scheme-send-definition)
              ("M-i s r" . 'scheme-send-region)
              ("M-i s s" . 'scheme-send-last-sexp)))

;;; racket-mode
(use-package racket-mode
  :config
  :mode ("\\.rkt\\'" . racket-mode))

;;; geiser-mode
(use-package geiser-mode
  :config
  (setq geiser-default-implementation 'guile)
  :bind (:map geiser-mode-map
              ("M-`" . 'tmm-menubar)
              ("M-i M-M" . 'geiser-repl-switch-to-module)
              ("M-i M-Z" . 'geiser-mode-switch-to-repl)
              ("M-i g r" . 'run-geiser)
              ("M-i M-h s" . 'geiser-doc-symbol-at-point)
              ("M-i e b" . 'geiser-eval-buffer)
              ("M-i e d" . 'geiser-eval-definition)
              ("M-i e r" . 'geiser-eval-region)
              ("M-i e s" . 'geiser-eval-last-sexp)))

(use-package geiser-repl
  :bind (:map geiser-repl-mode-map
              ("M-RET" . 'geiser-repl-maybe-send)))

;;; geiser-chez
(use-package geiser-chez)

;;; geiser-chicken
(use-package geiser-chicken)

;;; geiser-gambit
(use-package geiser-gambit)

;;; geiser-guile
(use-package geiser-guile)

;;; geiser-mit
(use-package geiser-mit)

;;; geiser-racket
(use-package geiser-racket
  :config
  (setq auto-mode-alist (remove '("\\.rkt\\'" . scheme-mode) auto-mode-alist)))

;;; geiser-stklos
(use-package geiser-stklos)

;;; enomem/en-company-scheme
(use-package enomem/en-company-scheme :load-path "site-lisp")

;;; enomem/en-fly
(use-package enomem/en-fly :load-path "site-lisp"
  :hook (racket-mode . flycheck-mode))

;;; enomem/en-edit
(use-package enomem/en-edit :load-path "site-lisp"
  :after paredit
  :hook ((scheme-mode racket-mode) . en-edit/scheme-mode-setup)
  :hook ((scheme-mode racket-mode geiser-repl-mode racket-repl-mode) . paredit-mode)
  :preface
  (defun en-edit/scheme-mode-setup ()
    (setq whitespace-style space-whitespace-style)
    (en-edit/whitespace-mode-reload)))

;;; enomem/en-emacs
(use-package enomem/en-emacs :load-path "site-lisp"
  :after window-purpose
  :config
  (add-to-list 'purpose-user-mode-purposes '(scheme-mode . scheme))
  (add-to-list 'purpose-user-mode-purposes '(racket-mode . scheme))
  (add-to-list 'purpose-user-mode-purposes '(geiser-repl-mode . scheme+repl))
  (add-to-list 'purpose-user-mode-purposes '(racket-repl-mode . scheme+repl))
  (purpose-compile-user-configuration))

(provide 'enomem/en-scheme)
