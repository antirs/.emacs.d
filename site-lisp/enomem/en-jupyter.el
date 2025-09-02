;;; ein
(use-package ein
  :config
  (setq ein:polymode t)
  (setq request-backend 'url-retrieve)
  (setq request-backend 'curl))

;;; ein-notebook
(use-package ein-notebook
  :bind (:map enomem-mode-map
              ("M-s M-e o" . 'ein:notebook-open)
              ("M-s M-e c" . 'ein:notebook-close)))

;;; ein-notebooklist
(use-package ein-notebooklist
  :bind (:map enomem-mode-map
              ("M-s M-e L" . 'ein:notebooklist-login)
              ("M-s M-e l" . 'ein:notebooklist-open)))

;;; ein-jupyter
(use-package ein-jupyter
  :bind (:map enomem-mode-map
              ("M-s M-e s" . 'ein:jupyter-server-start)
              ("M-s M-e S" . 'ein:jupyter-server-stop)))

;;; jupyter
(use-package jupyter)

;;; jupyter-repl
(use-package jupyter-repl
  :bind (:map enomem-mode-map
              ("M-s M-j o" . 'jupyter-run-repl)
              ("M-s M-j k" . 'jupyter-kill-kernel)))

;;; jupyter-server
(use-package jupyter-server
  :bind (:map enomem-mode-map
              ("M-s M-j c" . 'jupyter-connect-server-repl)
              ("M-s M-j r" . 'jupyter-run-server-repl)
              ("M-s M-j l" . 'jupyter-server-list-kernels)
              ("M-s M-j k" . 'jupyter-server-launch-kernel)))

;;; enomem/en-browser
(use-package enomem/en-browser :load-path "site-lisp"
  :hook (ein:notebooklist-mode . en-browser/ein-notebooklist-mode-setup)
  :preface
  (defun en-browser/ein-notebooklist-mode-setup ()
    (setq browse-url-browser-function 'browse-url-chromium)))

(provide 'enomem/en-jupyter)
