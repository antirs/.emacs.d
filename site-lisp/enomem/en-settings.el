;;; enomem/en-settings
(use-package enomem/en-settings :load-path "site-lisp" :defer t
  :config
  ;; user
  (setq user-full-name "Nobody Noone")
  (setq user-mail-address "nobody.noone@nowhere.none")
  ;; input
  (setq default-input-method 'russian-computer)
  ;; lockfiles
  (setq create-lockfiles nil)
  ;; tabs
  (make-variable-buffer-local 'indent-line-function)
  (make-variable-buffer-local 'indent-region-function)
  (make-variable-buffer-local 'tab-always-indent)
  (make-variable-buffer-local 'tab-stop-list)
  (make-variable-buffer-local 'indent-tabs-mode)
  ;; exit
  (fset 'yes-or-no-p 'y-or-n-p)
  (remove-hook 'kill-buffer-query-functions
               'process-kill-buffer-query-function)
  :bind (:map enomem-mode-map
              ;; keys
              ;; basic keys
              ("M-h" . backward-char)
              ("M-j" . next-line)
              ("M-k" . previous-line)
              ("M-l" . forward-char)
              ;; edit keys
              ("M-d" . kill-word)
              ("C-h" . backward-delete-char)
              ;; window/buffer/frame keys
              ("M-0" . delete-window)
              ("M-1" . delete-other-windows)
              ("M-2" . split-window-below)
              ("M-3" . split-window-right)
              ("M-6" . previous-multiframe-window)
              ("M-7" . previous-buffer)
              ("M-8" . next-buffer)
              ("M-9" . next-multiframe-window)
              ;; undo keys
              ("M-z" . undo)
              ;; prefixed keys ;;
              ;; window/buffer/frame keys
              ("M-u M-b R" . revert-buffer-with-coding-system)
              ("M-u M-b b" . bs-show)
              ("M-u M-b r" . revert-buffer)
              ("M-u M-b s" . switch-to-buffer)
              ("M-u M-w r" . move-to-window-line-top-bottom)
              ;; complete keys
              ("M-i M-i" . 'completion-at-point)
              ;; visual keys
              ("M-u M-w l" . visual-line-mode)
              ("M-u M-w n" . display-line-numbers-mode)
              ;; mark keys
              ("M-u M-," . pop-global-mark)
              ("M-u M-." . pop-to-mark-command)
              ("M-u M-' c" . en-settings/clear-global-mark-ring)
              ("M-SPC" . set-mark-command)
              ("M-u M-SPC" . just-one-space)
              ;; bookmark keys
              ("M-u M-' j" . bookmark-jump)
              ("M-u M-' s" . bookmark-set)
              ;; edit keys
              ("M-u M-e c" . describe-char)
              ("M-u M-e q" . exit-recursive-edit)
              ("M-u M-e s" . sort-lines)
              ("M-u M-e t" . tabify)
              ("M-u M-e u" . untabify)
              ;; file keys
              ("M-u M-f o" . ff-find-other-file)
              ("M-u M-f M-o" . find-file-other-window)
              ("M-u M-f f" . find-file-at-point)
              ;; goto keys
              ("M-u M-g l" . goto-line)
              ;; input keys
              ("M-u M-i" . toggle-input-method)
              ;; library keys
              ("M-u M-l l" . load-library)
              ("M-u M-l p" . list-packages)
              ("M-u M-l i" . package-install-file)
              ;; user help keys
              ("M-g M-i" . info)
              ("M-u M-h" . help-command)
              ("M-u M-m m" . man)
              ("M-u M-m w" . woman))
  :preface
  (defun en-settings/clear-global-mark-ring ()
    (interactive)
    (setq global-mark-ring nil)))

;;; package
(use-package package
  :config
  (setq native-comp-deferred-compilation nil)
  (setq package-native-compile t))

;;; delsel
(use-package delsel
  :config
  (pending-delete-mode t))

;;; paren
(use-package paren
  :config
  (show-paren-mode t))

;;; simple
(use-package simple
  :config
  (setq print-length 2000)
  (column-number-mode t)
  :bind (:map enomem-mode-map
              ("M-g M-L" . 'list-processes)
              ("M-g M-l" . 'join-line)))

;;; server
(use-package server
  :config
  (remove-hook 'kill-emacs-query-functions 'server-kill-emacs-query-function))

;;; linum
(use-package linum
  :config
  (setq linum-format "%3d "))

;;; files
(use-package files
  :config
  (setq auto-save-default nil)
  (setq confirm-kill-processes nil)
  (setq make-backup-files nil))

;;; recentf
(use-package recentf
  :init
  (setq recentf-exclude '("^/tmp/.*"))
  (make-variable-buffer-local 'recentf-exclude)
  :config
  (setq recentf-max-menu-items 1000)
  (setq recentf-max-saved-items 1000)
  (recentf-mode t))

;;; saveplace
(use-package saveplace
  :config
  (save-place-mode t))

;;; select
(use-package select
  :config
  (setq select-enable-clipboard nil)
  (setq select-enable-primary t))

;;; winner
(use-package winner
  :hook (enomem-mode . winner-mode)
  :bind (:map winner-mode-map
              ("M-g M-j" . winner-undo)
              ("M-g M-k" . winner-redo)))

;;; imenu
(use-package imenu
  :bind (:map enomem-mode-map
              ("M-g M-m a" . imenu-add-menubar-index)
              ("M-g M-m l" . imenu-list)
              ("M-g M-m r" . imenu-list-refresh)))

;;; calendar
(use-package calendar
  :config
  (setq calendar-latitude  00.000000)
  (setq calendar-longitude 00.000000))

(provide 'enomem/en-settings)
