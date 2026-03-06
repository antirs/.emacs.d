;;; ocaml
(use-package caml
  :bind (:map enomem-mode-map
              ("M-r M-C" . 'run-caml)))

;;; sml-mode
(use-package sml-mode)

;;; smlfmt
(use-package smlfmt)

;;; sml-basis
(use-package sml-basis)

;;; tuareg
(use-package tuareg
  :mode (("\\.ml[ily]?$" . tuareg-mode)
         ("\\.topml$" . tuareg-mode))
  :bind (:map tuareg-mode-map
              ("M-T . c" . #'tuareg-insert-class-form)
              ("M-T . b" . #'tuareg-insert-begin-form)
              ("M-T . f" . #'tuareg-insert-for-form)
              ("M-T . w" . #'tuareg-insert-while-form)
              ("M-T . i" . #'tuareg-insert-if-form)
              ("M-T . l" . #'tuareg-insert-let-form)
              ("M-T . m" . #'tuareg-insert-match-form)
              ("M-T . t" . #'tuareg-insert-try-form)
              ("C-M-x" . 'tuareg-eval-phrase)
              ("M-t g n" . 'tuareg-interactive-next-error-source)
              ("M-r M-T" . 'tuareg-run-ocaml)))

;;; merlin
(use-package merlin :disabled
  :config
  (setq merlin-command "ocamlmerlin")
  :hook (tuareg-mode . merlin-mode))

;;; utop
(use-package utop)

;;; dune
(use-package dune)

;;; opam-switch-mode
(use-package opam-switch-mode
  :bind (:map enomem-mode-map
              ("M-i M-o s" . 'opam-switch-set-switch)))

;;; bap-mode
(use-package bap-mode)

;;; enomem/en-company
(use-package enomem/en-company-ml :load-path "site-lisp")

;;; enomem/en-fold
(use-package enomem/en-fold :load-path "site-lisp"
  :hook (tuareg-mode . origami-mode))

;;; enomem/en-edit
(use-package enomem/en-edit :load-path "site-lisp"
  :hook (tuareg-mode . en-edit/caml-mode-setup)
  :preface
  (defun en-edit/caml-mode-setup ()
    (setq whitespace-style relaxed-space-whitespace-style)
    (en-edit/whitespace-mode-reload)))

(provide 'enomem/en-ml)
