;;; realgud
(use-package realgud
  :bind (:map enomem-mode-map
              ("M-r M-r g" . realgud:gdb)
              ("M-r M-r p" . realgud:pdb)))

;;; enomem/en-emacs
(use-package enomem/en-emacs :load-path "site-lisp"
  :after window-purpose
  :config
  (add-to-list 'purpose-user-mode-purposes '(gud-mode . debug))
  (purpose-compile-user-configuration))

(provide 'enomem/en-debug)
