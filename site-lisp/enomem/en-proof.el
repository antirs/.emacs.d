;;; system/proof
(use-package system/proof :load-path "site-lisp"
  :config
  (setq *acl2-sources-dir* "~/code/_source/utexas.edu/cs.utexas.edu/users/moore/acl2/v8-5/distrib/acl2-sources/"))

;;; proof-general
(use-package proof-general/general/proof-site :no-require
  :config
  (use-package coq/coq-mode :no-require
    :autoload coq-mode
    :bind (:map enomem-mode-map
                ("M-i M-q M-t" . 'coq-insert-term)
                ("M-i M-q S" . 'coq-insert-solve-tactic)
                ("M-i M-q T" . 'coq-insert-tactical)
                ("M-i M-q c" . 'coq-insert-command)
                ("M-i M-q i" . 'coq-insert-intros)
                ("M-i M-q m" . 'coq-insert-match)
                ("M-i M-q r" . 'coq-insert-requires)
                ("M-i M-q s" . 'coq-insert-section-or-module)
                ("M-i M-q t" . 'coq-insert-tactic)
                ("M-i M-q q" . 'coq-query)))
  :bind (:map enomem-mode-map
              ("M-i M-g I" . 'proof-interrupt-process)
              ("M-i M-g R" . 'proof-shell-restart)
              ("M-i M-g b" . 'proof-process-buffer)
              ("M-i M-g f" . 'proof-find-theorems)
              ("M-i M-g g" . 'proof-goto-point)
              ("M-i M-g h" . 'proof-help)
              ("M-i M-g i" . 'proof-query-identifier)
              ("M-i M-g q" . 'proof-shell-exit)
              ("M-i M-g r" . 'proof-retract-buffer)
              ("M-i M-g u" . 'proof-undo-last-successful-command)))

;;; holes
(use-package holes
  :hook (coq-mode . holes-mode))

;;; z3-mode
(use-package z3-mode
  :bind (:map z3-mode-map
              ("M-i M-r" . 'z3-execute-region)))

;;; minizinc-mode
(use-package minizinc-mode
  :mode (("\\.mzn\\'" . minizinc-mode)
         ("\\.fzn\\'" . minizinc-mode)
         ("\\.dzn\\'" . minizinc-mode))
  :hook (minizinc-mode . minizinc-mode/minizinc-mode-setup)
  :bind (:map minizinc-mode-map
              ("C-i" . indent-for-tab-command))
  :preface
  (defun minizinc-mode/minizinc-mode-setup ()
    (setq indent-tabs-mode t)
    (setq tab-stop-list '(0 4 8 0))
    (setq indent-line-function 'tab-to-tab-stop)
    (setq indent-region-function 'indent-relative)))

;;; enomem/en-company-coq
(use-package enomem/en-company-coq :load-path "site-lisp")

;;; enomem/en-fly
(use-package enomem/en-fly :load-path "site-lisp"
  :hook (minizinc-mode . flycheck-mode))

;;; enomem/en-emacs
(use-package enomem/en-emacs :load-path "site-lisp"
  :after window-purpose
  :config
  (add-to-list 'purpose-user-mode-purposes '(coq-mode . coq))
  (add-to-list 'purpose-user-mode-purposes '(coq-goals-mode . coq+goals))
  (add-to-list 'purpose-user-mode-purposes '(coq-response-mode . coq+response))
  (purpose-compile-user-configuration))

(provide 'enomem/en-proof)
