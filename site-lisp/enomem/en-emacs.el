;;; enomem/en-emacs
(use-package enomem/en-emacs :load-path "site-lisp" :defer t
  :config
  (setenv "LC_COLLATE" "C")
  (put 'erase-buffer 'disabled nil))

;;; treemacs
(use-package treemacs
  :config
  (setq treemacs-git-mode nil)
  (setq treemacs-filewatch-mode nil)
  :bind (:map enomem-mode-map
              ("M-t M-q" . treemacs)
              ("M-t M-t" . treemacs-select-window)
              ("M-t t b a" . treemacs-add-bookmark)
              ("M-t t r c" . treemacs-run-shell-command-in-project-root)
              ("M-t t p a" . treemacs-add-project-to-workspace)
              ("M-t t p d" . treemacs-remove-project-from-workspace)
              ("M-t t s" . treemacs-select-window)
              ("M-t t d" . 'treemacs-select-directory)
              ("M-t t w a" . treemacs-create-workspace)
              ("M-t t w d" . treemacs-remove-workspace)
              ("M-t t w e" . treemacs-edit-workspaces)
              ("M-t t w s" . treemacs-switch-workspace)))

;;; persp-mode
(use-package persp-mode)

;;; hydra
(use-package hydra
  :config
  (defhydra hydra-commands ()
    "Main"
    ("w" engine-mode-hydra/body "web" :exit t)
    ("p" pandoc-@-hydra/body "pandoc" :exit t))
  :bind (:map enomem-mode-map
              ("M-t h b" . hydra-commands/body)
              ("M-t h d" . dap-hydra)))

;;; window-purpose
(use-package window-purpose
  :init
  (setq purpose-use-default-configuration t))

(use-package window-purpose
  :hook (enomem-mode . enomem/en-emacs/enomem-mode-setup)
  :bind (:map purpose-mode-map
              ("M-u M-p M-l" . purpose-load-window-layout)
              ("M-u M-p l r" . purpose-reset-window-layout)
              ("M-u M-p l s" . purpose-save-window-layout)
              ("M-u M-p M-b" . purpose-switch-buffer-with-purpose)
              ("M-u M-p b s" . switch-buffer-without-purpose)
              ("M-u M-p b x" . purpose-delete-non-dedicated-windows)
              ("M-u M-p d" . purpose-toggle-window-purpose-dedicated)
              ("M-u M-p D" . purpose-toggle-window-buffer-dedicated))
  :preface
  (defun enomem/en-emacs/enomem-mode-setup ()
    (purpose-mode)
    (purpose-x-kill-setup)))

;;; ivy
(use-package ivy
  :config
  (setq ivy-display-functions-alist
        '((ivy-completion-in-region . ivy-display-function-overlay)
          (t . nil)))
  (setq ivy-display-function 'ivy-display-function-fallback)
  (setq ivy-display-style 'plain)
  (setq ivy-do-completion-in-region t)
  (setq ivy-initial-inputs-alist '())
  :hook (after-init . ivy-mode))

;;; ivy-bibtex
(use-package ivy-bibtex)

;;; ivy-hydra
(use-package ivy-hydra
  :bind (:map ivy-mode-map
              ("M-i M-y" . 'ivy-dispatching-call)
              ("M-i M-u" . 'hydra-ivy/nil)
              ("M-i M-U" . 'hydra-ivy/body)))

;;; swiper
(use-package swiper
  :bind (:map enomem-mode-map
              ("M-u M-s" . swiper)))

;;; counsel
(use-package counsel
  :bind (:map ivy-mode-map
              ("M-i M-C" . 'counsel-company)
              ("M-i M-c B" . counsel-switch-buffer-other-window)
              ("M-i M-g" . counsel-recentf)
              ("M-t c G" . counsel-grep)
              ("M-t c a" . counsel-ack)
              ("M-t c g" . counsel-ag)
              ("M-t c r" . counsel-rg)
              ("M-t c o" . counsel-org-goto-all)))

(provide 'enomem/en-emacs)
