;;; system/python
(use-package system/python :load-path "site-lisp"
  :config
  ;; pylookup
  (use-package pylookup
    :bind (:map enomem-mode-map
                ("M-g M-d p" . pylookup-lookup))))

;;; python
(use-package python
  :config
  (setq python-shell-interpreter
        (expand-file-name (concat (getenv "VIRTUAL_ENV") "/bin/ipython")))
  (setq python-shell-interpreter-args "--simple-prompt -i")
  (setq python-indent-offset 4)
  :bind (:map python-mode-map
              ("M-s M-<" . python-indent-shift-left)
              ("M-s M->" . python-indent-shift-right)
              ("M-i M-p r" . run-python)
              ("M-i M-s b" . python-shell-send-buffer)
              ("M-i M-s d" . python-shell-send-defun)
              ("M-i M-s f" . python-shell-send-file)
              ("M-i M-s s" . python-shell-send-statement)
              ("M-i M-s r" . python-shell-send-region)))

;;; pyvenv
(use-package pyvenv
  :init
  (defadvice pyvenv-activate (after python-activate activate)
    (en-python/python-shell-interpreter-setup))
  (defadvice pyvenv-deactivate (after python-deactivate activate)
    (en-python/python-shell-interpreter-setup))
  (defadvice pyvenv-workon (after python-workon activate)
    (en-python/python-shell-interpreter-setup))
  :config
  (setq python-shell-interpreter-args "--simple-prompt -i")
  :bind (:map enomem-mode-map
              ("M-i M-p a" . pyvenv-activate)
              ("M-i M-p d" . pyvenv-deactivate)
              ("M-i M-p w" . pyvenv-workon))
  :preface
  (defun en-python/python-shell-interpreter-setup ()
    (setq python-shell-interpreter
          (expand-file-name (concat (getenv "VIRTUAL_ENV") "/bin/ipython")))
    (message (format "Interpreter for python is changed to: %s"
                     python-shell-interpreter))))

;;; anaconda-mode
(use-package anaconda-mode
  :hook (python-mode . anaconda-mode)
  :hook (anaconda-mode . anaconda-mode/anaconda-mode-setup)
  :config
  (setq anaconda-mode-sync-request-timeout 5)
  :bind (:map anaconda-mode-map
              ("C-M-_" . nil)
              ("C-M-i" . nil)
              ("M-," . nil)
              ("M-." . nil)
              ("M-?" . nil)
              ("M-s M-h" . anaconda-mode-show-doc)
              ("M-s M-a M-=" . anaconda-mode-find-assignments)
              ("M-s M-a M-." . anaconda-mode-find-definitions)
              ("M-s M-a M-?" . anaconda-mode-find-references)
              ("M-s M-a M-h" . anaconda-mode-show-doc))
  :preface
  (defun anaconda-mode/anaconda-mode-setup ()
    (turn-off-anaconda-eldoc-mode)))

;;; poetry
(use-package poetry)

;;; enomem/en-company-python
(use-package enomem/en-company-python :load-path "site-lisp")

;;; enomem/en-lsp-python
(use-package enomem/en-lsp-python :load-path "site-lisp")

;;; enomem/en-debug
(use-package enomem/en-debug :load-path "site-lisp")

;;; enomem/en-emacs
(use-package enomem/en-emacs :load-path "site-lisp"
  :after window-purpose
  :config
  (add-to-list 'purpose-user-mode-purposes '(python-mode . py))
  (add-to-list 'purpose-user-mode-purposes '(inferior-python-mode . py+repl))
  (purpose-compile-user-configuration))

(provide 'enomem/en-python)
