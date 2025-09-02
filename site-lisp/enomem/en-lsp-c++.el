;;; enomem/en-lsp
(use-package enomem/en-lsp :load-path "site-lisp"
  :after lsp-mode
  :config
  (add-to-list 'lsp-language-id-configuration '(acsl-mode . "c"))
  :hook ((c-mode c++-mode objc-mode cuda-mode) . en-lsp/cc-mode-setup)
  :hook (acsl-mode . en-lsp/cc-mode-setup)
  :preface
  (defun en-lsp/cc-mode-setup ()
    (setq lsp-disabled-clients '(ccls))
    (setq lsp-enabled-clients '(clangd))
    (lsp-deferred)))

;;; lsp-clangd
(use-package lsp-clangd
  :config
  ;; (setq lsp-clients-clangd-args '("--enable-config" "-j" "4" "--background-index" "--index-file" ".cache/clangd.dex" "--remote-index-address" "10.10.10.10:50051"))
  (setq lsp-clients-clangd-args '("--enable-config" "--clang-tidy"
                                  "--header-insertion-decorators=0" "-j" "4")))

;;; ccls
(use-package ccls :disabled
  :config
  (setq ccls-executable "~/.local/usr/local/bin/ccls")
  (setq ccls-args `("-log-file=/tmp/ccls.log" "-v=1"
                    ,(concat "--init=" (f-read "~/.ccls"))))
  :bind (:map c-mode-base-map
              ("M-s M-c c" . ccls-call-hierarchy)
              ("M-s M-c i" . ccls-inheritance-hierarchy)
              ("M-s M-c m" . ccls-member-hierarchy)
              ("M-s M-c p" . ccls-preprocess-file)))

;;; eglot
(use-package eglot :disabled
  :config
  (setq clangd-args '("--enable-config" "--clang-tidy" "-j" "4"))
  (add-to-list 'eglot-server-programs
               `((c++-mode c-mode) .
                 ,(cons "clangd" clangd-args)))
  :bind (:map eglot-mode-map
              ("M-s M-e a" . 'eglot-code-actions)
              ("M-s M-e r" . 'eglot-rename))
  :hook ((c-mode c++-mode) . eglot-setup)
  :preface
  (defun eglot/c-mode-setup ()
    (setq eglot-stay-out-of '(company))
    (setq eglot-ignored-server-capabilites '(:hoverProvider
                                             :documentHighlightProvider))
    (eglot-ensure)))

(provide 'enomem/en-lsp-c++)
