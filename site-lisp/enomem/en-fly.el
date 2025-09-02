;;; flycheck
(use-package flycheck
  :init
  (setq flycheck-checkers nil)
  (make-variable-buffer-local 'flycheck--automatically-enabled-checkers)
  (make-variable-buffer-local 'flycheck-checkers)
  :config
  (setq flycheck-check-syntax-automatically '(save mode-enabled))
  (setq flycheck-checker-error-threshold 1000)
  (setq flycheck-display-errors-function nil)
  (setq flycheck-highlighting-mode nil)
  (flycheck-hide-error-buffer)
  :bind (:map flycheck-mode-map
              ("M-s M-f M-n" . flycheck-next-error)
              ("M-s M-f M-p" . flycheck-previous-error)
              ("M-s M-f e" . flycheck-explain-error-at-point)
              ("M-s M-f s" . 'flycheck-select-checker)
              ("M-s M-f l" . flycheck-list-errors)))

;;; flymake
(use-package flymake
  :config
  :bind (:map flymake-mode-map
              ("M-g n" . flymake-goto-next-error)
              ("M-g p" . flymake-goto-prev-error)
              ("M-s M-f e" . flymake-show-diagnostics-buffer)
              ("M-s M-f n" . flymake-goto-next-error)
              ("M-s M-f p" . flymake-goto-prev-error)
              ("M-s M-f s" . flymake-show-diagnostic)))

;;; enomem/en-emacs
(use-package enomem/en-emacs :load-path "site-lisp"
  :after window-purpose
  :config
  (add-to-list 'purpose-user-mode-purposes
               '(flycheck-error-list-mode . flycheck/errors))
  (add-to-list 'purpose-user-mode-purposes
               '(flymake-diagnostics-buffer-mode . flymake/errors))
  (purpose-compile-user-configuration))

(provide 'enomem/en-fly)
