;;; docker
(use-package docker
  :init
  ;; (setq docker-command "docker")
  ;; (setq docker-command "/usr/bin/docker")
  (setq docker-command "podman")
  :bind (:map enomem-mode-map
              ("M-t D C" . docker-compose)
              ("M-t D c" . docker-containers)
              ("M-t D i" . docker-images)
              ("M-t D n" . docker-networks)
              ("M-t D v" . docker-volumes)))

;;; docker-tramp
(use-package docker-tramp
  :config
  (setq docker-tramp-docker-executable "podman")
  (setq docker-tramp-method "podman"))

;;; dockerfile-mode
(use-package dockerfile-mode)

;;; jsonnet-mode
(use-package jsonnet-mode
  :mode (("\\.libsonnet" . jsonnet-mode)
         ("\\.jsonnet" . jsonnet-mode)))

;;; enomem/en-edit
(use-package enomem/en-edit :load-path "site-lisp"
  :hook ((jsonnet-mode) . en-jsonnet/jsonnet-mode-setup)
  :preface
  (defun en-jsonnet/jsonnet-mode-setup ()
    (setq tab-width 2)
    (setq whitespace-style space-whitespace-style)
    (en-edit/whitespace-mode-reload)))

(provide 'enomem/en-docker)
