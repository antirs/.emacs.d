;;; pascal-mode
(use-package pascal-mode
  :config
  (setq pascal-indent-level 2)
  (setq tab-width 2)
  :mode ("\\.\\(pas\\|PAS\\|ob07\\|pp\\)\\'" . pascal-mode))

;;; enomem/en-edit
(use-package enomem/en-edit :load-path "site-lisp"
  :hook ((asm-mode nasm-mode) . en-edit/asm-mode-setup)
  :preface
  (defun en-edit/asm-mode-setup ()
    (setq whitespace-style space-whitespace-style)
    (en-edit/whitespace-mode-reload)))

(provide 'enomem/en-pascal)
