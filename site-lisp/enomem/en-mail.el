;;; gnus
(use-package gnus
  :config
  (setq gnus-init-file "~/.emacs.d/gnus.el")
  ;; gnus keys
  :bind (:map enomem-mode-map
              ("M-t g g" . gnus))
  :bind (:map gnus-summary-mode-map
              ("M-t" . nil)
              ("M-t g d" . gnus-summary-delete-article)))

;;; message
(use-package message
  :config
  (setq message-confirm-send t)
  (setq message-send-mail-function 'smtpmail-send-it)
  :mode ("/mutt" . message-mode))

;;; bbdb
(use-package bbdb
  :config
  (setq bbdb-file "~/.emacs.d/bbdb")
  (setq bbdb-mua-auto-update-p 'query)
  (bbdb-initialize 'gnus 'message)
  (bbdb-mua-auto-update-init 'message))

;;; notmuch
(use-package notmuch
  :config
  (setq notmuch-search-oldest-first nil)
  (setq notmuch-saved-searches
        `((:name "inbox" :query "tag:inbox" :sort-order newest-first :key ,(kbd "i"))
          (:name "unread" :query "tag:unread" :key ,(kbd "u"))
          (:name "flagged" :query "tag:flagged" :key ,(kbd "f"))
          (:name "sent" :query "tag:sent" :key ,(kbd "t"))
          (:name "drafts" :query "tag:draft" :key ,(kbd "d"))
          (:name "all mail" :query "*" :key ,(kbd "a"))))
  :bind (:map enomem-mode-map
              ("M-t m p" . notmuch-poll)
              ("M-t m n" . notmuch)))

;;; notmuch-address
(use-package notmuch-addr
  :config
  :hook (notmuch-address . en-main/notmuch-addr)
  :preface
  (defun en-main/notmuch-addr ()
    (notmuch-addr-setup)))

;;; enomem/en-crypt
(use-package enomem/en-crypt :load-path "site-lisp")

;;; atom2rss
(use-package atom2rss :load-path "site-lisp/enomem/scripts")

(provide 'enomem/en-mail)
