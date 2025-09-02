;;; system/dict
(use-package system/dict :load-path "site-lisp"
  :bind (:map enomem-mode-map
              ("M-t d r c" . 'reverso-context)))

;;; dictionary
(use-package dictionary
  :init
  (setq dictionary-default-dictionary "*")
  (setq dictionary-default-stategy "substring")
  :config
  (setq dictionary-server "localhost")
  :bind (:map enomem-mode-map
              ("M-t d d" . dictionary-lookup-definition)
              ("M-t d s" . dictionary-search)))

(provide 'enomem/en-dict)
