;;; dap-mode
(use-package dap-mode
  :config
  (setq dap-auto-configure-features
        '(sessions locals breakpoints expressions tooltip))
  :hook (dap-mode . en-dap/dap-mode-setup)
  :bind (:map enomem-mode-map
              ("M-r d B" . dap-ui-breakpoints)
              ("M-r d L" . dap-ui-locals)
              ("M-r d R" . dap-ui-repl)
              ("M-r d S" . dap-ui-sessions)
              ("M-r d e a" . dap-ui-expressions)
              ("M-r d w h" . dap-ui-hide-many-windows)
              ("M-r d w s" . dap-ui-show-many-windows)
              ("M-r M-b" . dap-breakpoint-toggle)
              ("M-r M-c" . dap-continue)
              ("M-r M-d" . dap-debug)
              ("M-r M-i" . dap-step-in)
              ("M-r M-n" . dap-next)
              ("M-r M-o" . dap-step-out)
              ("M-r d D A" . dap-delete-all-sessions)
              ("M-r d D S" . dap-delete-session)
              ("M-r d T e" . dap-debug-edit-template)
              ("M-r d T s" . dap--select-template)
              ("M-r d b a" . dap-breakpoint-add)
              ("M-r d b b" . dap-breakpoint-toggle)
              ("M-r d b c" . dap-breakpoint-condition)
              ("M-r d b d" . dap-breakpoint-delete)
              ("M-r d b h" . dap-breakpoint-hit-condition)
              ("M-r d b l" . dap-breakpoint-log-message)
              ("M-r d c" . dap-continue)
              ("M-r d d" . dap-debug)
              ("M-r d e e" . dap-eval)
              ("M-r d e r" . dap-eval-region)
              ("M-r d e s" . dap-eval-thing-at-point)
              ("M-r d f" . dap-restart-frame)
              ("M-r d i" . dap-step-in)
              ("M-r d l" . dap-debug-last)
              ("M-r d n" . dap-next)
              ("M-r d o" . dap-step-out)
              ("M-r d r" . dap-debug-recent)
              ("M-r d s f" . dap-switch-stack-frame)
              ("M-r d s s" . dap-switch-session)
              ("M-r d s t" . dap-switch-thread)
              ("M-r d t s" . dap-stop-thread)
              ("M-r d x" . dap-disconnect))
  :preface
  (defun en-dap/dap-mode-setup ()
    (setq dap-ui-buffer-configurations
          `((,dap-ui--breakpoints-buffer . ((side . left) (slot . 2)
                                            (window-width . ,treemacs-width)))
            (,dap-ui--debug-window-buffer . ((side . bottom) (slot . 3)
                                             (window-width . 0.10)))
            (,dap-ui--expressions-buffer . ((side . right) (slot . 2)
                                            (window-width . 0.25)))
            (,dap-ui--locals-buffer . ((side . right) (slot . 1)
                                       (window-width . 0.25)))
            (,dap-ui--repl-buffer . ((side . bottom) (slot . 3)
                                     (window-height . 0.30)))
            (,dap-ui--sessions-buffer . ((side . right) (slot . 3)
                                         (window-width . 0.25)))))))

;;; dap-ui
(use-package dap-ui)

;;; enomem/en-emacs
(use-package enomem/en-emacs :load-path "site-lisp"
  :after window-purpose
  :config
  (add-to-list 'purpose-user-name-purposes '("*dap-ui-breakpoints*" . dap+breakpoints))
  (add-to-list 'purpose-user-name-purposes '("*dap-ui-expressions*" . dap+expressions))
  (add-to-list 'purpose-user-name-purposes '("*dap-ui-locals*" . dap+locals))
  (add-to-list 'purpose-user-name-purposes '("*dap-ui-repl*" . dap+repl))
  (add-to-list 'purpose-user-name-purposes '("*dap-ui-sessions*" . dap+sessions))
  (purpose-compile-user-configuration))

(provide 'enomem/en-dap)
