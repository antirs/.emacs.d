;;; system/tex
(use-package system/art :load-path "site-lisp")

;;; sclang
(use-package sclang
  :hook (sclang-mode . sclang/sclang-mode-setup)
  :bind (:map enomem-mode-map
              ("M-s M-O" . 'sclang-stop)
              ("M-s M-S" . 'sclang-start)
              ("M-s M-K" . 'sclang-kill)
              ("M-s M-F" . 'sclang-server-free-all)
              ("M-s M-q" . 'sclang-server-quit)
              ("M-s M-b" . 'sclang-server-boot)
              ("M-s M-R" . 'sclang-server-reboot))
  :preface
  (defun sclang/sclang-mode-setup ()
    (setq indent-tabs-mode t)))

;;; enomem/en-edit
(use-package enomem/en-edit :load-path "site-lisp"
  :hook (sclang-mode . en-edit/sclang-mode-setup)
  :preface
  (defun en-edit/sclang-mode-setup ()
    (setq whitespace-style tab-whitespace-style)
    (en-edit/whitespace-mode-reload)))

(provide 'enomem/en-art)
