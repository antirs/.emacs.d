;;; gnus
(use-package gnus
  :config
  (setq gnus-startup-file "~/.emacs.d/.newsrc")
  (setq gnus-home-directory "~/.emacs.d/.gnus/")
  (setq gnus-directory "~/.emacs.d/.news")
  (setq nnfolder-directory "~/.emacs.d/.mail/archive")
  (setq nnmail-expiry-wait 'immediate)
  (setq gnus-use-dribble-file nil)
  (setq gnus-gcc-mark-as-read t)
  (setq gnus-buttonized-mime-types '("multipart/signed" "multipart/encrypted" "multipart/alternative"))
  (setq mm-sign-option 'guided)
  (setq mm-verify-option 'guided)
  (setq gnus-select-method '(nnimap "mail.sys.nonet"
                                    (nnimap-address "mail.sys.nonet")
                                    (nnimap-stream network)
                                    (nnimap-server-port 143)
                                    (nnimap-authinfo-file "~/.authinfo.gpg")))
  (setq gnus-message-archive-group
        `(("enomem" "nnimap+nonet:enomem/sent")
          (".*" ,(format-time-string "sent/%Y-%m"))))
  (setq gnus-parameters
        '(("enomem"
           (charset . utf-8)
           (display . all)
           (posting-style
            (address "enomem@substation.nonet")
            (gcc "nnimap+nonet:enomem/sent")
            (name "enomem")
            (organization "noname"))
           (expiry-target "nnimap+nonet:enomem/trash"))))
  (setq gnus-permanently-visible-groups
        (concat "^\\(INBOX\\|sent\\|trash\\)")
  (setq gnus-summary-line-format
        (concat
         "%0{%U%R%z%}"
         "%3{│%} "
         "%4{%-30,30F%} " ;; from
         "%3{│%} "
         "%1{%B%}"
         "%s\n"))
  (gnus-demon-add-handler 'gnus-demon-scan-news 5 t)
  :hook (gnus-group-mode . gnus-group-mode-setup)
  :hook (gnus-summary-mode . gnus-browser-setup)
  :preface
  (defun gnus-group-mode-setup ()
    (gnus-group-sort-groups 'gnus-group-sort-by-alphabet))
  (defun gnus-browser-setup ()
    (setq browse-url-browser-function 'browse-url-chromium)))

;;; MESSAGE
(use-package message
  :config
  (setq message-directory "~/.emacs.d/.mail")
  (setq message-signature-file ".signature")
  (setq message-signature-directory "~/.emacs.d/.signature")
  (setq smtpmail-smtp-server "mail.sys.nonet"
        smtpmail-smtp-service 587))
