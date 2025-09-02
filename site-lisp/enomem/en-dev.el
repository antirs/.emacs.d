;;; system/dev
(use-package system/dev
  :config
  ;; devdocs-lookup
  (use-package devdocs-lookup
    :bind (:map enomem-mode-map
                ("M-g M-d r" . devdocs-lookup/devdocs-run)
                ("M-g M-d d" . devdocs-lookup))))

;;; spdx
(use-package spdx
  :bind (:map prog-mode-map
              ("M-s M-F" . 'spdx-insert-copyright)
              ("M-s M-L" . 'spdx-insert-spdx)))

(provide 'enomem/en-dev)
