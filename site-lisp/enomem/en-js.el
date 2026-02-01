;;; js-mode
(use-package js
  :mode (("\\.js\\'" . js-mode)
         ("\\.jsx\\'" . js-mode)
         ("\\.cjs\\'" . js-mode)
         ("\\.mjs\\'" . js-mode))
  :interpreter "node"
  :config
  (setq js-indent-level 2))

;;; js2-mode
(use-package js2-mode
  :interpreter "node"
  :hook (js-mode . en-js/js2-mode-setup)
  :bind (:map js-mode-map
              ("M-i M-j e" . 'js2-display-error-list)
              ("M-i M-j n" . 'js2-next-error))
  :preface
  (defun en-js/js2-mode-setup ()
    (if (not (member major-mode '(json-mode jsonian-mode)))
        (js2-minor-mode))))

;;; typescript-mode
(use-package typescript-mode
  :mode (("\\.ts\\'" . typescript-mode))
  :mode (("\\.tsx\\'" . typescript-mode)))

;;; js-comint
(use-package js-comint
  :bind (:map enomem-mode-map
              ("M-i s R" . js-comint-repl)
              ("M-i s l" . js-send-last-sexp)
              ("M-i s b" . js-send-buffer)
              ("M-i s r" . js-send-region)))

;;; json-mode
(use-package json-mode :disabled)

;;; jsonian
(use-package jsonian
  :config
  (setq jsonian-indentation 4))

;;; indium
(use-package indium
  :config
  (setq indium-chrome-data-dir "/tmp/chromium")
  (setq indium-chrome-use-temporary-profile t)
  :hook ((js-mode js-jsx-mode typescript-mode) . indium-interaction-mode)
  :hook (indium-interaction-mode . en-js/indium-interaction-mode-setup)
  :bind (:map indium-interaction-mode-map
              ("M-i M-x e" . 'indium-eval-last-node)
              ("M-i M-x i" . 'indium-inspect-last-node))
  :bind (:map enomem-mode-map
              ("M-i M-C" . indium-connect)
              ("M-i M-D" . indium-switch-to-debugger)
              ("M-i M-L" . indium-launch)
              ("M-i M-R" . indium-reload)
              ("M-i M-S" . indium-scratch)
              ("M-i M-Z" . indium-switch-to-repl-buffer)
              ("M-i M-x d" . indium-eval-defun)
              ("M-i M-x l" . indium-eval-last-node)
              ("M-i M-x r" . indium-eval-region)
              ("M-r M-:" . 'indium-inspect-expression)
              ("M-r M-c" . 'indium-debugger-resume)
              ("M-r M-i" . 'indium-inspect-last-node)
              ("M-r M-i" . indium-debugger-step-into)
              ("M-r M-n" . indium-debugger-step-over)
              ("M-r M-o" . indium-debugger-step-out)
              ("M-r b  K" . indium-remove-all-breakpoints-from-buffer)
              ("M-r b  a" . indium-activate-breakpoints)
              ("M-r b  b" . indium-add-breakpoint)
              ("M-r b  c" . indium-add-conditional-breakpoint)
              ("M-r b  d" . indium-deactivate-breakpoints)
              ("M-r b  e" . indium-edit-breakpoint-condition)
              ("M-r b  k" . indium-remove-breakpoint)
              ("M-r b  l" . indium-list-breakpoints)
              ("M-r b  t" . indium-toggle-breakpoint)
              ("M-r f l" . 'indium-debugger-frames-list)
              ("M-r f n" . 'indium-debugger-frames-next-frame)
              ("M-r f p" . 'indium-debugger-frames-previous-frame))
  :preface
  (defun en-js/indium-interaction-mode-setup ()
    (if (string-equal (buffer-name) "*JS scratch*")
        (eldoc-mode -1))))

;;; tide
(use-package tide
  :init
  (setq tide-show-documentation nil)
  (setq tide-completion-setup-company-backend nil)
  :hook ((js-mode js-jsx-mode typescript-mode) . en-js/tide-mode-setup)
  :bind (:map enomem-mode-map
              ("M-i D d" . tide-jsdoc-template)
              ("M-i d e" . tide-error-at-point)
              ("M-i d d" . tide-documentation-at-point))
  :preface
  (defun en-js/tide-mode-setup ()
    (if (and (buffer-file-name)
             (not (member major-mode '(indium-debugger-mode))))
        (tide-setup))))

;;; jq-mode
(use-package jq-mode)

;;; jq-format
(use-package jq-format)

;;; prettier-js
(use-package prettier-js
  :config
  (setq prettier-js-args
        '("--trailing-comma" "none"
          "--bracket-spacing" "true"
          "--single-quote" "true"
          "--jsx-single-quote" "true"
          "--jsx-bracket-same-line" "true"
          "--print-width" "80")))

;;; nvm
(use-package nvm)

;;; enomem/en-company-js
(use-package enomem/en-company-js :load-path "site-lisp")

;;; enomem/en-lsp-js
(use-package enomem/en-lsp-js :load-path "site-lisp")

;;; enomem/en-lsp-json
(use-package enomem/en-lsp-json :load-path "site-lisp")

;;; enomem/en-edit
(use-package enomem/en-edit :load-path "site-lisp"
  :hook ((js-mode typescript-mode) . en-edit/js-mode-setup)
  :hook ((json-mode jsonian-mode) . en-edit/json-mode-setup)
  :preface
  (defun en-edit/js-mode-setup ()
    (setq tab-width 2)
    (setq whitespace-style space-whitespace-style)
    (en-edit/whitespace-mode-reload))
  (defun en-edit/json-mode-setup ()
    (setq whitespace-style relaxed-space-whitespace-style)
    (en-edit/whitespace-mode-reload)))

;;; enomem/en-emacs
(use-package enomem/en-emacs :load-path "site-lisp"
  :after window-purpose
  :config
  (add-to-list 'purpose-user-mode-purposes '(indium-repl-mode . js+repl))
  (add-to-list 'purpose-user-mode-purposes '(js-comint-mode . js+repl))
  (add-to-list 'purpose-user-mode-purposes '(js-jsx-mode . js))
  (add-to-list 'purpose-user-mode-purposes '(js-mode . js))
  (add-to-list 'purpose-user-mode-purposes '(json-mode . json))
  (add-to-list 'purpose-user-mode-purposes '(jsonian-mode . json))
  (add-to-list 'purpose-user-mode-purposes '(typescript-mode . js))
  (purpose-compile-user-configuration))

;;; enomem/en-browser
(use-package enomem/en-browser :load-path "site-lisp"
  :hook (js-mode . en-browser/js-mode-setup)
  :preface
  (defun en-browser/js-mode-setup ()
    (setq browse-url-browser-function 'browse-url-chromium)))

(provide 'enomem/en-js)
