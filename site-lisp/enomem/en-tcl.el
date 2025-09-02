;;; rust-mode
(use-package tcl-mode
  :mode ("\\(\\.tm\\|\\.bawt\\)\\'" . tcl-mode))

;;; enomem/en-fly-tcl
(use-package enomem/en-fly-tcl :load-path "site-lisp")

;;; enomem/en-edit
(use-package enomem/en-edit :load-path "site-lisp"
  :hook (tcl-mode . en-edit/tcl-mode-setup)
  :preface
  (defun en-edit/tcl-mode-setup ()
    (setq tab-width 4)
    (setq whitespace-style space-whitespace-style)
    (en-edit/whitespace-mode-reload)))

(provide 'enomem/en-tcl)
