;;; enomem/en-lsp
(use-package enomem/en-lsp :load-path "site-lisp"
  :after lsp-mode
  :config
  (add-to-list 'lsp-language-id-configuration '(sage-shell:sage-mode . "python"))
  :hook (python-mode . en-lsp-python/python-mode-setup)
  :hook (sage-shell:sage-mode . en-lsp-python/python-mode-setup)
  :preface
  (defun en-lsp-python/python-mode-setup ()
    (setq lsp-disabled-clients '(pyls))
    (setq lsp-enabled-clients '(pylsp))
    (lsp-deferred)))

;;; lsp-pylsp
(use-package lsp-pylsp
  :after sage-mode
  :config
  (push 'sage-shell:sage-mode
        (lsp--client-major-modes (gethash 'pylsp lsp-clients)))
  (setq lsp-pylsp-plugins-autopep8-enabled nil)
  (setq lsp-pylsp-plugins-flake8-enabled t)
  (setq lsp-pylsp-plugins-jedi-completion-enabled t)
  (setq lsp-pylsp-plugins-jedi-definition-enabled t)
  (setq lsp-pylsp-plugins-jedi-hover-enabled t)
  (setq lsp-pylsp-plugins-jedi-references-enabled t)
  (setq lsp-pylsp-plugins-jedi-signature-help-enabled t)
  (setq lsp-pylsp-plugins-jedi-symbols-enabled t)
  (setq lsp-pylsp-plugins-mccabe-enabled nil)
  (setq lsp-pylsp-plugins-pycodestyle-enabled nil)
  (setq lsp-pylsp-plugins-pydocstyle-enabled t)
  (setq lsp-pylsp-plugins-pyflakes-enabled nil)
  (setq lsp-pylsp-plugins-pylint-enabled t)
  (setq lsp-pylsp-plugins-rope-completion-enabled nil)
  (setq lsp-pylsp-plugins-yapf-enabled nil))

(provide 'enomem/en-lsp-python)
