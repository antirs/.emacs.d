;;; system/c++
(use-package system/c++ :load-path "site-lisp")

;;; cc-mode
(use-package cc-mode
  :mode ("\\.h\\(h\\|xx\\|pp\\)\\'" . c++-mode)
  :config
  (c-add-style "vscode"
               '("linux"
                 (c-basic-offset . 4)   ; Guessed value
                 (c-offsets-alist
                  (access-label . -4)         ; Guessed value
                  (block-close . 0)           ; Guessed value
                  (class-close . 0)           ; Guessed value
                  (defun-block-intro . +)     ; Guessed value
                  (defun-close . 0)           ; Guessed value
                  (inclass . +)               ; Guessed value
                  (inline-close . 0)          ; Guessed value
                  (innamespace . 0)           ; Guessed value
                  (member-init-intro . +)     ; Guessed value
                  (namespace-close . 0)       ; Guessed value
                  (statement . 0)             ; Guessed value
                  (statement-block-intro . +) ; Guessed value
                  (statement-cont . 7)        ; Guessed value
                  (topmost-intro . 0)         ; Guessed value
                  (topmost-intro-cont . 0)    ; Guessed value
                  (inlambda . 0))))
  :hook ((c-mode c++-mode) . cc-mode/cc-mode-setup)
  :preface
  (defun cc-mode/cc-mode-setup ()
    (c-set-style "gnu")
    (c-set-offset 'brace-list-open 0)
    (c-set-offset 'inline-open nil)
    (c-set-offset 'substatement-open 0)
    (setq c-basic-offset 4)))

;;; rtags
(use-package rtags
  :config
  (setq rtags-autostart-diagnostics t)
  (setq rtags-diagnostics-summary-in-mode-line nil)
  (setq rtags-jump-to-first-match nil)
  (setq rtags-process-flags "--block-argument '--driver-mode='")
  (setq rtags-reindex-on-save nil)
  (setq rtags-suspend-during-compilation t)
  (rtags-enable-standard-keybindings nil "M-s M-r")
  :bind (:map c-mode-map
              ;; process
              ("M-s M-r q" . rtags-quit-rdm)
              ("M-s M-r r" . rtags-restart-process)
              ("M-s M-r s" . rtags-start-process-unless-running)
              ;; find
              ("M-s M-r f ," . rtags-find-references-at-point)
              ("M-s M-r f ." . rtags-find-symbol-at-point)
              ("M-s M-r f a" . rtags-find-all-references-at-point)
              ("M-s M-r f c" . rtags-find-functions-called-by-this-function)
              ("M-s M-r f f" . rtags-find-file)
              ("M-s M-r f r" . rtags-find-references)
              ("M-s M-r f s" . rtags-find-symbol))
  :hook ((c-mode c++-mode) . rtags/cc-mode-setup)
  :preface
  (defun rtags/cc-mode-setup ()
    (rtags-start-process-unless-running)))

;;; irony
(use-package irony :disabled
  (irony-cdb-autosetup-compile-options)
  :bind (:map irony-mode-map
              ("M-s M-i t" . irony-get-type))
  :hook ((c-mode c++-mode) . irony-mode)
  :hook ((c-mode c++-mode) . irony/cc-mode-setup)
  :preface
  (defun irony/cc-mode-setup ()
    (irony-cdb-autosetup-compile-options)))

;;; enomem/en-tags
(use-package enomem/en-tags :load-path "site-lisp"
  :hook ((c-mode c++-mode) . cscope-minor-mode)
  :hook ((c-mode c++-mode) . ggtags-mode)
  :hook ((c-mode c++-mode) . enomem/en-tags/cc-mode-setup)
  :preface
  (defun enomem/en-tags/cc-mode-setup ()
    (setenv "GTAGSLIBPATH" "/home/enomem/.tags.d/c++")))

;;; enomem/en-company-c++
(use-package enomem/en-company-c++ :load-path "site-lisp")

;;; enomem/en-fly-c++
(use-package enomem/en-fly-c++ :load-path "site-lisp"
  :hook ((c-mode c++-mode) . enomem/en-fly-c++/cc-mode-setup)
  :preface
  (defun enomem/en-fly-c++/cc-mode-setup ()
    (if (not (member (file-name-extension (buffer-name))
                     '("sing" "lib")))
        (flycheck-mode))))

;;; enomem/en-lsp-c++
(use-package enomem/en-lsp-c++ :load-path "site-lisp")

;;; clang-format
(use-package clang-format
  :config
  (setq clang-format-style-option "google")
  (make-variable-buffer-local 'clang-format-style-option)
  :bind (:map c-mode-map
              ("M-s f r" . clang-format-region)
              ("M-s f b" . clang-format/reformat-buffer))
  :bind (:map c++-mode-map
              ("M-s f r" . clang-format-region)
              ("M-s f b" . clang-format/reformat-buffer))
  :preface
  (defun clang-format/reformat-buffer ()
    (interactive)
    (save-excursion
      (clang-format-buffer)
      (indent-region (point-min) (point-max) nil))))

;;; enomem/en-edit
(use-package enomem/en-edit :load-path "site-lisp"
  :hook ((c-mode c++-mode objc-mode) . en-edit/cc-mode-setup)
  :hook (rtags-asm-mode . en-edit/rtags-asm-mode-setup)
  :hook (rtags-preprocess-mode . en-edit/rtags-preprocess-mode-setup)
  :preface
  (defun en-edit/cc-mode-setup ()
    (setq tab-width 4)
    (setq whitespace-style space-whitespace-style)
    (en-edit/whitespace-mode-reload))
  (defun en-edit/rtags-preprocess-mode-setup ()
    (setq tab-width 4)
    (setq whitespace-style relaxed-space-whitespace-style)
    (en-edit/whitespace-mode-reload))
  (defun en-edit/rtags-asm-mode-setup ()
    (setq whitespace-style '(face
                             big-indent
                             indentation::tab
                             lines
                             space-after-tab
                             space-after-tab::space
                             space-after-tab::tab
                             space-before-tab
                             space-before-tab::tab
                             space-before-tab::space
                             trailing))
    (en-edit/whitespace-mode-reload)))

;;; enomem/en-emacs
(use-package enomem/en-emacs :load-path "site-lisp"
  :after window-purpose
  :config
  (add-to-list 'purpose-user-mode-purposes '(c-mode . c))
  (add-to-list 'purpose-user-mode-purposes '(c++-mode . c++))
  (purpose-compile-user-configuration))

(provide 'enomem/en-c++)
