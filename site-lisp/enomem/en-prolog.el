;;; system/prolog
(use-package system/prolog :load-path "site-lisp")

;;; prolog
(use-package prolog
  :mode ("\\.pl\\'" . prolog-mode)
  :mode ("\\.m\\'" . mercury-mode)
  :mode ("\\.\\(mh\\|mih\\)$" . c++-mode)
  :init
  (setq prolog-system 'swi)
  (make-variable-buffer-local 'prolog-system)
  :hook (prolog-mode . prolog/prolog-mode-setup)
  :hook (mercury-mode . prolog/mercury-mode-setup)
  :preface
  (defun prolog/prolog-mode-setup ()
    (setq prolog-system 'swi)
    (setq prolog-program-name "swipl"))
  (defun prolog/mercury-mode-setup ()
    (setq prolog-system 'mercury)
    (setq prolog-program-name nil)))

;;; enomem/en-lsp-prolog
(use-package enomem/en-lsp-prolog :load-path "site-lisp")

;;; enomem/en-edit
(use-package enomem/en-edit :load-path "site-lisp"
  :hook ((prolog-mode mercury-mode) . en-edit/prolog-mode-setup)
  :preface
  (defun en-edit/prolog-mode-setup ()
    (setq whitespace-style relaxed-space-whitespace-style)
    (en-edit/whitespace-mode-reload)))

;;; enomem/en-fold
(use-package enomem/en-fold :load-path "site-lisp"
  :hook ((mercury-mode prolog-mode) . origami-mode))

;;; enomem/en-fly-prolog
(use-package enomem/en-fly-prolog :load-path "site-lisp")

(provide 'enomem/en-prolog)
