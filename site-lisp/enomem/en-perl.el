;;; perl-mode
(use-package perl-mode
  :mode ("\\(\\.cgi\\|\\.t\\)\\'" . perl-mode))

;;; cperl-mode
(use-package cperl-mode
  :config
  (setq cperl-indent-level 4)
  (setq cperl-indent-parens-as-block t)
  (setq cperl-close-paren-offset -4)
  (setq cperl-auto-newline nil)
  :hook (perl-mode . cperl-mode)
  :bind (:map cperl-mode-map
              ("M-s M-h" . 'cperl-perldoc-at-point))
  :hook (perl-mode . cperl-mode))

;;; enomem/en-lsp-perl
(use-package enomem/en-lsp-perl :load-path "site-lisp")

;;; enomem/en-edit
(use-package enomem/en-edit :load-path "site-lisp"
  :hook (perl-mode . en-edit/perl-mode-setup)
  :preface
  (defun en-edit/perl-mode-setup ()
    (setq whitespace-style relaxed-space-whitespace-style)
    (en-edit/whitespace-mode-reload)))

;;; enomem/en-emacs
(use-package enomem/en-emacs :load-path "site-lisp"
  :after window-purpose
  :config
  (add-to-list 'purpose-user-mode-purposes '(perl-mode . perl))
  (add-to-list 'purpose-user-mode-purposes '(cperl-mode . perl))
  (purpose-compile-user-configuration))

;;; pde-load
(use-package pde-load :load-path "pde" :disabled)

;;; perl-completion
(use-package perl-completion :load-path "site-lisp/enomem/scripts" :disabled)

(provide 'enomem/en-perl)
