;;; pinentry
(use-package pinentry
  :config
  (pinentry-start))

;;; epa
(use-package epa
  :config
  (setq epa-pinentry-mode 'loopback)
  (setq epg-pinentry-mode 'loopback)
  (setq epg-gpg-home-directory "/home/enomem/.gnupg")
  :bind (:map enomem-mode-map
              ("M-u M-c f d" . 'epa-decrypt-file)
              ("M-u M-c f e" . 'epa-encrypt-file)
              ("M-u M-c d" . 'epa-decrypt-region)
              ("M-u M-c e" . 'epa-encrypt-region)))

;;; epa-mail
(use-package epa-mail
  :bind (:map enomem-mode-map
              ("M-u M-c m d" . 'epa-mail-decrypt)
              ("M-u M-c m e" . 'epa-mail-encrypt)
              ("M-u M-c m s" . 'epa-mail-sign)
              ("M-u M-c m v" . 'epa-mail-verify)))

(provide 'enomem/en-crypt)
