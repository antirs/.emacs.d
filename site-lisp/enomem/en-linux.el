;;; system/linux
(use-package system/linux :load-path "site-lisp"
  :config
  (use-package enomem/en-fold :load-path "site-lisp"
    :hook (selinuxpolicy-mode . enomem/en-fold/selinuxpolicy-mode-setup)
    :preface
    (defun enomem/en-fold/selinuxpolicy-mode-setup ()
      (if (not (member major-mode '(wdl-mode)))
          (hs-minor-mode)))))

;;; debian-el
(use-package debian-el)

;;; dpkg-dev-el
(use-package dpkg-dev-el)

;;; nix
(use-package nix)

;;; guix
(use-package guix)

;;; dts-mode
(use-package dts-mode)

;;; enomem/en-edit
(use-package enomem/en-edit :load-path "site-lisp"
  :hook (systemtap-mode . enomem/en-edit/systemtap-mode-setup)
  :preface
  (defun enomem/en-edit/systemtap-mode-setup ()
    (setq whitespace-style space-whitespace-style)
    (en-edit/whitespace-mode-reload)))

(provide 'enomem/en-linux)
