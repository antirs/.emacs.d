;;; system/lisp
(use-package system/lisp :load-path "site-lisp")

;;; elisp-mode
(use-package elisp-mode
  :bind (:map emacs-lisp-mode-map
              ("M-i M-s b" . eval-buffer)
              ("M-i M-s r" . eval-region)
              ("M-i M-e" . ielm)))

;;; lisp-data-mode
(use-package lisp-mode)

;;; ielm
(use-package ielm
  :bind (:map enomem-mode-map
              ("M-i M-e" . ielm)))

;;; literate-elisp
(use-package literate-elisp)

;;; enomem/en-company-elisp
(use-package enomem/en-company-elisp :load-path "site-lisp")

;;; enomem/en-edit
(use-package enomem/en-edit :load-path "site-lisp"
  :after paredit
  :hook ((emacs-lisp-mode lisp-data-mode) . en-edit/emacs-lisp-mode-setup)
  :hook ((emacs-lisp-mode inferior-emacs-lisp-mode) . paredit-mode)
  :preface
  (defun en-edit/emacs-lisp-mode-setup ()
    (setq indent-tabs-mode nil)
    (setq whitespace-style space-whitespace-style)
    (en-edit/whitespace-mode-reload)))

;;; enomem/en-emacs
(use-package enomem/en-emacs :load-path "site-lisp"
  :after window-purpose
  :config
  (add-to-list 'purpose-user-mode-purposes '(backtrace-mode . elisp+backtrace))
  (add-to-list 'purpose-user-mode-purposes '(edebug-eval-mode . elisp+eval))
  (add-to-list 'purpose-user-mode-purposes '(edebug-trace-mode . elisp+trace))
  (add-to-list 'purpose-user-mode-purposes '(emacs-lisp-mode . elisp))
  (add-to-list 'purpose-user-mode-purposes '(inferior-emacs-lisp-mode . elisp+repl))
  (purpose-compile-user-configuration))

(provide 'enomem/en-elisp)
