;;; hexl
(use-package hexl
  :bind (:map enomem-mode-map
              ("M-u M-x f" . hexl-find-file))
  :bind (:map hexl-mode-map
              ("M-u" . nil)
              ("M-u M-x a" . hexl-current-address)
              ("M-u M-x c" . hexl-insert-hex-char)
              ("M-u M-x g" . hexl-goto-address)
              ("M-u M-x s" . hexl-insert-hex-string)))

;;; nhexl-mode
(use-package nhexl-mode
  :hook (hexl-mode . nhexl-mode)
  :bind (:map nhexl-mode-map
              ("C-h" . nhexl-overwrite-delete-char)
              ("M-u M-x h" . nhexl-hex-edit-mode)))

;;; hexldiff
(use-package hexldiff :load-path "site-lisp/enomem/scripts")

;;; hexview-mode
(use-package hexview-mode :load-path "site-lisp/enomem/scripts")

(provide 'enomem/en-rev)
