;;; ess-mode
(use-package ess-mode
  :hook (ess-mode . whitespace-mode)
  :bind (:map ess-mode-map
              ("C-c ?" . ess-help)
              ("C-c C-d" . ess-doc-map)
              ("M-s M-h" . ess-help)))

;;; ess-inf
(use-package ess-inf
  :bind (:map inferior-ess-mode-map
              ("C-c ?" . ess-help)
              ("C-c C-d" . ess-doc-map)
              ("M-s M-h" . ess-help)))

;;; enomem/en-mode
;; (use-package enomem/en-mode :load-path "site-lisp")

(provide 'enomem/en-r)
