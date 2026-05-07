;;; shell
(use-package shell
  :init
  (setenv "PS1" "\[\e[0;36m\]\T \[\e[0;34m\]\\u@\\H \[\e[1;37m\]\\w\[\e[0;37m\] \$ ")
  :bind (:map enomem-mode-map
              ("M-i M-s s" . shell)))

;;; sh-script
(use-package sh-script)

;;; term
(use-package term
  :bind (:map enomem-mode-map
              ("M-i M-t" . ansi-term)))

;;; vterm
(use-package vterm
  :bind (:map enomem-mode-map
              ("M-i M-v" . vterm)))

;;; emamux
(use-package emamux
  :config
  (setq emamux:runner-pane-height 30)
  (setq emamux:use-nearest-pane t)
  :bind (:map enomem-mode-map
              ("M-i i M-C" . emamux:run-last-command)
              ("M-i i M-c" . emamux:run-command)
              ("M-i i M-h" . emamux:split-window-horizontally)
              ("M-i i M-i" . emamux:inspect-runner)
              ("M-i i M-q" . emamux:interrupt-runner)
              ("M-i i M-r" . emamux:run-region)
              ("M-i i M-s" . emamux:send-command)
              ("M-i i M-v" . emamux:split-window)
              ("M-i i M-w" . emamux:new-window)
              ("M-i i M-z" . emamux:zoom-runner)))

;;; detached
(use-package detached
  :init
  (setq detached-session-directory
        (concat (or (getenv "TMPDIR") "/tmp") "/" "detached/sessions"))
  :config
  (setq detached-notification-function 'detached-state-transition-echo-message)
  (use-package detached-init
    :config
    (detached-init))
  (use-package detached-list
    :bind (:map detached-list-mode-map
                ("o" . 'detached-list-open-session)))
  :hook (detached-shell-mode . compilation-minor-mode)
  :bind (:map enomem-mode-map
              ("M-i M-d r" . 'detached-rerun-session)
              ("M-i M-d l" . 'detached-list-sessions)
              ("M-i M-d s" . 'detached-shell-command)))

;;; shfmt
(use-package shfmt
  :hook (save-hook . 'shfmt-buffer))

;;; enomem/en-company-shell
(use-package enomem/en-company-shell :load-path "site-lisp")

;;; enomem/en-lsp-shell
(use-package enomem/en-lsp-shell :load-path "site-lisp")

;;; enomem/en-prog
(use-package enomem/en-prog :load-path "site-lisp"
  :hook (sh-mode . en-prog/sh-mode-setup)
  :preface
  (defun en-prog/sh-mode-setup ()
    (electric-indent-local-mode t)))

;;; enomem/en-edit
(use-package enomem/en-edit :load-path "site-lisp"
  :hook (sh-mode . en-edit/sh-mode-setup)
  :preface
  (defun en-edit/sh-mode-setup ()
    (setq indent-tabs-mode t)
    (setq tab-width 4)
    (setq whitespace-style relaxed-tab-whitespace-style)
    (en-edit/whitespace-mode-reload)))

;;; enomem/en-emacs
(use-package enomem/en-emacs :load-path "site-lisp"
  :after window-purpose
  :config
  (add-to-list 'purpose-user-mode-purposes '(sh-mode . sh))
  (add-to-list 'purpose-user-mode-purposes '(shell-mode . shell))
  (add-to-list 'purpose-user-mode-purposes '(term-mode . shell))
  (purpose-compile-user-configuration))

(provide 'enomem/en-shell)
