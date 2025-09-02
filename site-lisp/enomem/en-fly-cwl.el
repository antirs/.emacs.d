;;; enomem/en-fly
(use-package enomem/en-fly :load-path "site-lisp"
  :after flycheck
  :config
  (setq flycheck-cwl-schema-path "/home/enomem/.emacs.d/site-lisp/enomem/etc/schemas/v1.2/CommonWorkflowLanguage.yml")
  :hook (cwl-mode . flycheck-mode))

(provide 'enomem/en-fly-cwl)
