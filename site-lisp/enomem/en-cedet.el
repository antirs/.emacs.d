;;; ede
(use-package ede)

;;; semantic
(use-package semantic :disabled
  :config
  (semantic-mode t)
  (global-semantic-idle-completions-mode -1)
  (global-semantic-idle-scheduler-mode t)
  (global-semantic-idle-summary-mode t)
  (global-semantic-mru-bookmark-mode t)
  (global-semanticdb-minor-mode t)
  (semanticdb-enable-gnu-global-databases 'java-mode t)
  (semanticdb-enable-gnu-global-databases 'c-mode t)
  (semanticdb-enable-gnu-global-databases 'c++-mode t)
  (setq semantic-idle-scheduler-idle-time 1.5)
  (setq semantic-symref-tool 'global)
  (setq semantic-inhibit-functions
        (list (lambda ()
                (not (member major-mode '(java-mode c-mode c++-mode))))))
  :bind (:map enomem-mode-map
              ("M-s s ," . semantic-force-refresh)
              ("M-s s SPC" . semantic-complete-symbol)
              ("M-s s a" . semantic-analyze-possible-completions)
              ("M-s s f r" . semantic-symref)
              ("M-s s f s" . semantic-symref-symbol)
              ("M-s s s" . 'semanticdb-save-all-db)
              ("M-s s j f" . semantic-ia-fast-jump)
              ("M-s s j j" . semantic-complete-jump)
              ("M-s s j l" . semantic-complete-jump-local)))

;;; enomem/en-company-cedet
(use-package enomem/en-company-cedet :load-path "site-lisp")

(provide 'enomem/en-cedet)
