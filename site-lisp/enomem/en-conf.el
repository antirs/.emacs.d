;;; system/conf
(use-package system/conf :load-path "site-lisp")

;;; conf-mode
(use-package conf-mode :load-path "site-lisp"
  :mode ("\\.cson\\'" . conf-mode)
  :hook (conf-mode . conf-mode/conf-mode-setup)
  :preface
  (defun conf-mode/conf-mode-setup ()
    (setq tab-stop-list '(2 4 6 8 0))))

;;; yaml-mode
(use-package yaml-mode)

;;; cwl-mode
(use-package cwl-mode)

;;; wdl-mode
(use-package wdl-mode
  :config
  (setq wdl-indent-level 2))

;;; enomem/en-fly-cwl
(use-package enomem/en-fly-cwl :load-path "site-lisp")

;;; enomem/en-lsp-yaml
(use-package enomem/en-lsp-yaml :load-path "site-lisp")

;;; enomem/en-lsp-cwl
(use-package enomem/en-lsp-cwl :load-path "site-lisp")

;;; enomem/en-yas
(use-package enomem/en-yas :load-path "site-lisp"
  :hook (yaml-mode . yas-minor-mode))

;;; enomem/en-edit
(use-package enomem/en-edit :load-path "site-lisp"
  :hook (conf-mode . enomem/en-edit/conf-mode-setup)
  :hook (wdl-mode . enomem/en-edit/wdl-mode-setup)
  :hook (yaml-mode . enomem/en-edit/yaml-mode-setup)
  :hook (conf-mode . whitespace-mode)
  :hook (yaml-mode . whitespace-mode)
  :hook ((cwl-mode wdl-mode) . whitespace-mode)
  :preface
  (defun enomem/en-edit/wdl-mode-setup ()
    (setq tab-width 2)
    (setq whitespace-style relaxed-space-whitespace-style)
    (en-edit/fill-120)
    (en-edit/whitespace-mode-reload))
  (defun enomem/en-edit/conf-mode-setup ()
    (setq tab-width 2)
    (setq whitespace-style relaxed-space-whitespace-style)
    (en-edit/fill-120)
    (en-edit/whitespace-mode-reload))
  (defun enomem/en-edit/yaml-mode-setup ()
    (setq tab-width 2)
    (setq whitespace-style relaxed-space-whitespace-style)
    (en-edit/fill-120)
    (en-edit/whitespace-mode-reload)))

;;; enomem/en-fold
(use-package enomem/en-fold :load-path "site-lisp"
  :hook (conf-toml-mode . origami-mode)
  :hook (yaml-mode . origami-mode))

(provide 'enomem/en-conf)
