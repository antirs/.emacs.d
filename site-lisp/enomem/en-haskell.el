;;; system/haskell
(use-package system/haskell :load-path "site-lisp"
  :config
  (use-package ghc :disabled
    :hook (haskell-mode . system/haskell/ghc/ghc-setup)
    :preface
    (defun system/haskell/ghc/ghc-setup ()
      (ghc-init))))

;;; haskell-mode
(use-package haskell-mode
  :config
  (setq haskell-notify-p t)
  (setq haskell-interactive-popup-errors nil)
  (setq haskell-process-suggest-remove-import-lines t)
  (setq haskell-process-auto-import-loaded-modules t)
  (setq haskell-stylish-on-save nil)
  :bind (:map haskell-mode-map
              ("M-s M-s" . 'haskell-process-load-or-reload)
              ("M-s M-R" . 'haskell-process-restart)
              ("M-s M-r" . 'haskell-process-reload)
              ("M-g M-d h" . haskell-hoogle-lookup-from-local))
  :hook (haskell-mode . haskell-mode-setup)
  :preface
  (defun haskell-mode-setup ()
    (setq browse-url-browser-function 'browse-url-firefox)))

;;; cmm-mode
(use-package cmm-mode)

;;; dante
(use-package dante
  :hook (haskell-mode . dante-mode)
  :bind (:map dante-mode-map
              ("M-u M-d e" . 'dante-exec)
              ("M-u M-d i" . 'dante-info)
              ("M-u M-d r" . 'dante-restart)))

;;; hindent
(use-package hindent
  :hook (haskell-mode . hindent-mode))

;;; shm
(use-package shm :disabled
  :bind (:map shm-map
              ("M-a" . nil)
              ("M-k" . nil)
              ("M-s" . nil)
              ("M-w" . nil)
              ("M-y" . nil)
              ("M-s a" . shm/goto-parent)
              ("M-s k" . shm/kill-node)
              ("M-s r" . shm/raise)
              ("M-s s" . shm/splice)
              ("M-s w" . shm/copy-region)
              ("M-s y" . shm/yank-pop))
  :hook (haskell-mode . structured-haskell-mode))

;;; enomem/en-company-haskell
(use-package enomem/en-company-haskell :load-path "site-lisp")

;;; enomem/en-fly-haskell
(use-package enomem/en-fly-haskell :load-path "site-lisp")

;;; enomem/en-lsp-haskell
(use-package enomem/en-lsp-haskell :load-path "site-lisp")

;;; enomem/en-fold
(use-package enomem/en-fold :load-path "site-lisp"
  :hook (haskell-mode . origami-mode))

;;; enomem/en-emacs
(use-package enomem/en-emacs :load-path "site-lisp"
  :after window-purpose
  :config
  (add-to-list 'purpose-user-mode-purposes '(haskell-mode . haskell))
  (add-to-list 'purpose-user-mode-purposes '(haskell-interactive-mode . haskell+repl))
  (add-to-list 'purpose-user-mode-purposes '(inferior-haskell-mode . haskell+repl))
  (purpose-compile-user-configuration))

(provide 'enomem/en-haskell)
