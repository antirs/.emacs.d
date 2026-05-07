;;; nasm-mode
(use-package nasm-mode
  :config
  (define-derived-mode fasm-mode nasm-mode "fasm mode"
    "Major mode for distinguishing GNU `fasm` assembly")
  :mode ("\\.nasm\\'" . nasm-mode)
  :hook (nasm-mode . nasm-mode/nasm-mode-setup)
  :preface
  (defun nasm-mode/nasm-mode-setup ()
    (setq indent-tabs-mode t)
    (setq tab-stop-list '(0 4 8 0))
    (setq indent-line-function 'tab-to-tab-stop)
    (setq indent-region-function 'indent-relative)))

;;; asm-mode
(use-package asm-mode
  :config
  (define-derived-mode gas-mode asm-mode "gas mode"
    "Major mode for distinguishing GNU `as` assembly"
    (setq asm-comment-char ?#))
  :mode ("\\.\\(fasm\\|asm\\|s\\|S\\|inc\\)\\'" . asm-mode)
  :hook (asm-mode . asm-mode/asm-mode-setup)
  :preface
  (defun asm-mode/asm-mode-setup ()
    (setq tab-stop-list '(0 4 8 0))
    (setq indent-line-function 'tab-to-tab-stop)
    (setq indent-region-function 'indent-relative)
    (setq indent-tabs-mode 'only)))

;;; enomem/en-edit
(use-package enomem/en-edit :load-path "site-lisp"
  :hook ((asm-mode nasm-mode) . en-edit/asm-mode-setup)
  :preface
  (defun en-edit/asm-mode-setup ()
    (setq whitespace-style tab-whitespace-style)
    (en-edit/whitespace-mode-reload)))

(provide 'enomem/en-asm)
