;;; text-mode
(use-package text-mode
  :bind (:map enomem-mode-map
              ("M-g M-r" . 'center-region)
              ("M-g M-c" . 'center-paragraph)))

;;; enomem/en-edit
(use-package enomem/en-edit :load-path "site-lisp"
  :hook (text-mode . en-edit/text-mode-setup)
  :hook (text-mode . whitespace-mode)
  :preface
  (defun en-edit/text-mode-setup ()
    (setq fill-column 150)
    (setq indent-tabs-mode nil)
    (setq tab-width 4)
    (setq whitespace-line-column 150)
    (setq whitespace-style space-whitespace-style)
    (display-fill-column-indicator-mode)))

(provide 'enomem/en-text)
