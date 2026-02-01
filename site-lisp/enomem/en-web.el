;;; web-mode
(use-package web-mode
  :mode ("\\.html?\\'" . web-mode)
  :config
  (setq web-mode-code-indent-offset 2)
  (setq web-mode-css-indent-offset 2)
  (setq web-mode-markup-indent-offset 2)
  :hook (web-mode . en-web/web-mode-setup)
  :preface
  (defun en-web/web-mode-setup ()
    (setq browse-url-browser-function 'browse-url-chromium)))

;;; wat-ts-mode
(use-package wat-ts-mode
  :mode ("\\.wat\\'" . 'wat-ts-mode)
  :mode ("\\.wast\\'" . 'wat-ts-mode))

;;; emmet-mode
(use-package emmet-mode
  :hook (web-mode . emmet-mode))

;;; pug-mode
(use-package pug-mode
  :config
  (setq pug-tab-width 2))

;;; simple-httpd
(use-package simple-httpd
  :bind (:map enomem-mode-map
              ("M-r M-h a" . httpd-start)
              ("M-r M-h s" . httpd-serve-directory)
              ("M-r M-h o" . httpd-stop)))

;;; skewer
(use-package skewer
  :hook (web-mode . skewer-mode))

;;; skewer-html
(use-package skewer-html
  :hook (web-mode . skewer-html-mode))

;;; skewer-css
(use-package skewer-css
  :hook (css-mode . skewer-css-mode))

;;; impatient-mode
(use-package impatient-mode
  :init
  (setq impatient-mode-delay 1000)
  :hook (web-mode . impatient-mode)
  :hook (after-save . imp--update-buffer))

;;; restclient-mode
(use-package restclient-mode
  :mode (("\\.http?\\'" . restclient-mode))
  :config
  :hook (restclient-response-received . en-web/my-restclient-hook)
  :preface
  (defvar my-restclient-token nil)
  (defun en-web/my-restclient-hook ()
    "Update token from a request."
    (save-excursion
      (save-match-data
        ;; update regexp to extract required data
        (when (re-search-forward "\"__formtok\" value=\"\\(.*?\\)\"" nil t)
          (setq my-restclient-token (match-string 1)))))))

;;; webdriver
(use-package webdriver)

;;; enomem/en-edit
(use-package enomem/en-edit :load-path "site-lisp"
  :hook (web-mode . en-edit/web-mode-setup)
  :preface
  (defun en-edit/web-mode-setup ()
    (setq tab-width 2)
    (setq whitespace-style space-whitespace-style)
    (en-edit/whitespace-mode-reload)))

(provide 'enomem/en-web)
