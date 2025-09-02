;;; enomem/en-lsp
(use-package enomem/en-lsp :load-path "site-lisp"
  :after lsp-mode
  :config
  (add-to-list 'lsp-language-id-configuration '(cperl-mode . "perl"))
  :hook (perl-mode . en-lsp/perl-mode-setup)
  ;; :hook (cperl-mode . en-lsp/perl-save-hook)
  :preface
  (defun en-lsp/perl-save-hook ()
    (add-hook 'after-save-hook 'lsp-format-buffer nil t))
  (defun en-lsp/perl-mode-setup ()
    (setq lsp-disabled-clients '(perl-language-server perlnavigator))
    (setq lsp-enabled-clients '(pls))
    (lsp-deferred)))

;;; lsp-pls
(use-package lsp-pls
  :config
  (setq lsp-pls-perlcritic-enabled t)
  (setq lsp-pls-perltidy-rc "~/.perltidyrc")
  (setq lsp-pls-syntax-enabled t))

;;; lsp-perl
(use-package lsp-perl :disabled)

;;; lsp-perlnavigator
(use-package lsp-perlnavigator :disabled)

(provide 'enomem/en-lsp-perl)
