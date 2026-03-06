;;; prog-mode
(use-package prog-mode
  :init
  (make-variable-buffer-local 'process-environment)
  :bind (:map enomem-mode-map
              ("M-c M-c" . compile)
              ("M-c M-C" . recompile)
              ("M-g M-n" . next-error)
              ("M-g M-p" . previous-error)))

;;; electric
(use-package electric
  :hook (prog-mode . en-prog/prog-mode-setup)
  :preface
  (defun en-prog/prog-mode-setup ()
    (electric-indent-mode -1)
    (electric-indent-local-mode -1)))

;;; aggressive-indent
(use-package aggressive-indent)

;;; eldoc
(use-package eldoc
  :init
  (make-variable-buffer-local 'eldoc-display-functions)
  (make-variable-buffer-local 'eldoc-documentation-functions)
  (make-variable-buffer-local 'eldoc-idle-delay))

;;; xref
(use-package xref
  :bind (:map enomem-mode-map
              ("M-," . xref-pop-marker-stack)
              ("M-." . xref-find-definitions)
              ("M-?" . xref-find-references)
              ("C-M-_" . xref-find-apropos)
              ("M-s x c" . xref/xref-clear-marker-stack-interactive)
              ("M-s x q" . 'xref-quit-and-pop-marker-stack)
              ("M-s x f a" . xref-find-apropos)
              ("M-s x f d" . xref-find-definitions)
              ("M-s x f r" . xref-find-references)
              ("M-s x p" . xref-pop-marker-stack)
              ("M-s x q" . 'xref-quit-and-pop-marker-stack))
  :preface
  (defun xref/xref-clear-marker-stack-interactive ()
    (interactive)
    (xref-clear-marker-stack)))

;;; minibuffer
(use-package minibuffer
  :init
  (make-variable-buffer-local 'completion-at-point-functions)
  :bind (:map enomem-mode-map
              ("M-i M-I" . 'enomem/minibuffer/completion-in-region-interactive))
  :preface
  (defun enomem/minibuffer/completion-in-region-interactive ()
    (interactive)
    (let ((completion-in-region-function #'completion--in-region))
      (save-excursion
        (completion-at-point)))))

;;; editorconfig
(use-package editorconfig)

;;; compile
(use-package compile
  :hook (compilation-filter . ansi-color-compilation-filter))

;;; projectile
(use-package projectile
  :hook (prog-mode . projectile-mode)
  :hook (text-mode . projectile-mode)
  :bind (:map projectile-mode-map
              ("M-t M-p d" . 'projectile-discover-projects-in-directory)
              ("M-t M-p s" . 'projectile-switch-project)))

;;; enomem/en-fold
(use-package enomem/en-fold :load-path "site-lisp"
  :hook (prog-mode . enomem/en-fold/prog-mode-setup)
  :preface
  (defun enomem/en-fold/prog-mode-setup ()
    (if (not (member major-mode '(bap-mode wdl-mode shaclc-mode shexc-mode)))
        (hs-minor-mode))))

;;; enomem/en-yas
(use-package enomem/en-yas :load-path "site-lisp"
  :hook (prog-mode . yas-minor-mode))

;;; enomem/en-fly
(use-package enomem/en-fly :load-path "site-lisp")

;;; enomem/en-edit
(use-package enomem/en-edit :load-path "site-lisp"
  :hook (prog-mode . en-edit/prog-mode-setup)
  :hook (prog-mode . whitespace-mode)
  :preface
  (defun en-edit/prog-mode-setup ()
    (setq tab-always-indent t)
    (setq fill-column 80)
    (setq indent-tabs-mode nil)
    (setq tab-width 4)
    (setq whitespace-line-column 80)
    (setq whitespace-style space-whitespace-style)
    (display-fill-column-indicator-mode)))

;;; enomem/en-emacs
(use-package enomem/en-emacs :load-path "site-lisp"
  :after window-purpose
  :config
  (add-to-list 'purpose-user-mode-purposes '(info-mode . info))
  (purpose-compile-user-configuration))

(provide 'enomem/en-prog)
