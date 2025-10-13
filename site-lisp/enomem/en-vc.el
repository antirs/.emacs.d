;;; system/vc
(use-package system/vc :load-path "site-lisp"
  :bind (:map hg-mode-map
              ("M-u M-V ." . 'mq-push)
              ("M-u M-V >" . 'mq-push-all)
              ("M-u M-V ," . 'mq-pop)
              ("M-u M-V <" . 'mq-pop-all)
              ("M-u M-V =" . 'mq-diff)
              ("M-u M-V r" . 'mq-refresh)
              ("M-u M-V e" . 'mq-refresh-edit)
              ("M-u M-V i" . 'mq-new)
              ("M-u M-V t" . 'mq-top)
              ("M-u M-v ," . 'hg-incoming)
              ("M-u M-v ." . 'hg-outgoing)
              ("M-u M-v =" . 'hg-diff)
              ("M-u M-v -" . 'hg-diff-repo)
              ("M-u M-v l" . 'hg-log)
              ("M-u M-v L" . 'hg-log-repo)
              ("M-u M-v s" . 'hg-status)
              ("M-u M-v ~" . 'hg-version-other-window)))

;;; diff
(use-package diff
  :config
  (setq diff-font-lock-syntax nil)
  (add-to-list 'auto-mode-alist '("\\.hg/patches\\(?:-[^/]+\\)?/" . diff-mode))
  :hook (diff-mode . en-vc/mq-patch-set-default-directory)
  :preface
  (defun en-vc/mq-patch-set-default-directory ()
    (when (string= ".hg" (nth 2 (reverse (split-string default-directory "/"))))
      (setq default-directory
            (expand-file-name (concat default-directory "../../"))))))

;;; ediff
(use-package ediff
  :config
  (setq ediff-split-window-function 'split-window-sensibly)
  (setq ediff-window-setup-function 'ediff-setup-windows-plain))

;;; vc
(use-package vc
  :config
  (setq vc-diff-switches '("-b" "-B" "-u"))
  (setq vc-git-diff-switches nil))

;;; magit
(use-package magit
  :config
  (setq transient-default-level 5)
  (setq magit-ediff-dwim-show-on-hunks t)
  :bind (:map magit-mode-map
              ("M-s M-g 1" . 'magit-section-show-level-1)
              ("M-s M-g 2" . 'magit-section-show-level-2)
              ("M-s M-g 3" . 'magit-section-show-level-3)
              ("M-s M-g 4" . 'magit-section-show-level-4)
              ("M-s M-g M-1" . 'magit-section-show-level-1-all)
              ("M-s M-g M-2" . 'magit-section-show-level-2-all)
              ("M-s M-g M-3" . 'magit-section-show-level-3-all)
              ("M-s M-g M-4" . 'magit-section-show-level-4-all))
  :bind (:map enomem-mode-map
              ("M-s M-g f" . magit-file-dispatch)
              ("M-s M-g g" . magit-status)))

;;; forge
(use-package forge)

;;; code-review
(use-package code-review :disabled
  :config
  (setq code-review-fill-column 80))

;;; ahg
(use-package ahg)

;;; quilt
(use-package quilt)

;;; dsvn
(use-package dsvn :disabled)

;;; magit-svn
(use-package magit-svn)

;;; diffed
(use-package diffed)

;;; enomem/en-emacs
(use-package enomem/en-emacs :load-path "site-lisp"
  :after window-purpose
  :config
  (add-to-list 'purpose-user-mode-purposes '(magit-diff-mode . magit+diff))
  (add-to-list 'purpose-user-mode-purposes '(magit-log-mode . magit+log))
  (add-to-list 'purpose-user-mode-purposes '(magit-reflog-mode . magit+log))
  (add-to-list 'purpose-user-mode-purposes '(magit-status-mode . magit+status))
  (add-to-list 'purpose-user-mode-purposes '(vc-dir-mode . vc+dir))
  (add-to-list 'purpose-user-mode-purposes '(vc-bzr-log-view-mode . vc+log))
  (add-to-list 'purpose-user-mode-purposes '(vc-git-log-view-mode . vc+log))
  (add-to-list 'purpose-user-mode-purposes '(vc-hg-log-view-mode . vc+log))
  (add-to-list 'purpose-user-mode-purposes '(vc-svn-log-view-mode . vc+log))
  (purpose-compile-user-configuration))

(provide 'enomem/en-vc)
