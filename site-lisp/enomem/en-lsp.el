;;; lsp-mode
(use-package lsp-mode
  :init
  (make-variable-buffer-local 'lsp-enabled-clients)
  (make-variable-buffer-local 'lsp-disabled-clients)
  :config
  ;; auto configure
  (setq lsp-auto-configure t)
  ;; breadcrumb
  (setq lsp-headerline-breadcrumb-enable t)
  ;; completion
  (setq lsp-completion-enable t)
  (setq lsp-completion-provider :capf)
  ;; diagnostics
  (setq lsp-diagnostics-provider :flycheck)
  ;; docs
  (setq lsp-eldoc-enable-hover t)
  ;; format
  (setq lsp-enable-on-type-formatting nil)
  (setq lsp-trim-trailing-whitespace nil)
  ;; highlights
  (setq lsp-enable-symbol-highlighting nil)
  (setq lsp-semantic-tokens-enable nil)
  ;; imenu
  (setq lsp-enable-imenu nil)
  ;; indentation
  (setq lsp-enable-indentation nil)
  ;; links
  (setq lsp-enable-links nil)
  ;; modeline
  (setq lsp-modeline-diagnostics-enable nil)
  (setq lsp-modeline-code-actions-enable nil)
  (setq lsp-modeline-workspace-status-enable nil)
  ;; ui
  (setq lsp-ui-doc-show-with-cursor nil)
  (setq lsp-ui-doc-show-with-mouse nil)
  (setq lsp-ui-sideline-show-code-actions nil)
  (setq lsp-ui-sideline-show-diagnostics nil)
  (setq lsp-ui-sideline-show-hover nil)
  (setq lsp-ui-sideline-show-symbol nil)
  ;; watcher
  (setq lsp-enable-file-watchers nil)
  (setq lsp-file-watch-threshold 1000)
  ;; xref
  (setq lsp-enable-xref t)
  :bind (:map lsp-mode-map
              ;; ("M-s M-?" . anaconda-mode-find-references)
              ;; ("M-s M-h" . anaconda-mode-show-doc)
              ("M-s M-l B" . lsp-headerline-breadcrumb-mode)
              ("M-s M-l C" . lsp-completion-mode)
              ("M-s M-l D" . lsp-diagnostics-mode)
              ("M-s M-l H" . lsp-ui-doc-mode)
              ("M-s M-l L" . lsp-lens-mode)
              ("M-s M-l M-p d" . 'lsp-ui-peek-find-definitions)
              ("M-s M-l M-p i" . 'lsp-ui-peek-find-implementation)
              ("M-s M-l M-p r" . 'lsp-ui-peek-find-references)
              ("M-s M-l M-p s" . 'lsp-ui-peek-find-workspace-symbol)
              ("M-s M-l P" . lsp-ui-peek-mode)
              ("M-s M-l S" . lsp-ui-sideline-mode)
              ("M-s M-l U" . lsp-ui-mode)
              ("M-s M-l a" . lsp-execute-code-action)
              ("M-s M-l d" . lsp-ui-doc-show)
              ("M-s M-l g" . 'lsp-ui-doc-glance)
              ("M-s M-;" . lsp-find-declaration)
              ("M-s M-." . lsp-find-definition)
              ("M-s M-\"" . lsp-find-implementation)
              ("M-s M-?" . lsp-find-references)
              ("M-s M-'" . lsp-find-type-definition)
              ("M-s M-:" . lsp-ui-find-workspace-symbol)
              ("M-s M-l M-;" . lsp-find-declaration)
              ("M-s M-l M-." . lsp-find-definition)
              ("M-s M-l M-\"" . lsp-find-implementation)
              ("M-s M-l M-?" . lsp-find-references)
              ("M-s M-l M-'" . lsp-find-type-definition)
              ("M-s M-l M-:" . lsp-ui-find-workspace-symbol)
              ("M-s M-l f d" . lsp-find-definition)
              ("M-s M-l f i" . lsp-find-implementation)
              ("M-s M-l f r" . lsp-find-references)
              ("M-s M-l f s" . lsp-ui-find-workspace-symbol)
              ("M-s M-l f t" . lsp-find-type-definition)
              ("M-s M-l f v" . lsp-find-declaration)
              ("M-s M-l h" . lsp-ui-doc-hide)
              ("M-s M-l i" . lsp-ui-imenu)
              ("M-s M-l l" . lsp-lens-show)
              ("M-s M-l r" . lsp-rename)
              ("M-s M-l w a" . lsp-workspace-folders-add)
              ("M-s M-n" . lsp-ui-find-next-reference)
              ("M-s M-p" . lsp-ui-find-prev-reference)
              ("M-s M-l w d" . lsp-workspace-folders-remove)
              ("M-s M-l w r" . lsp-workspace-restart)
              ("M-s M-l w s" . lsp-workspace-shutdown))
  :hook (lsp-mode . lsp-mode-setup)
  :preface
  (defun lsp-mode-setup ()
    ;; breadcrumb
    (lsp-headerline-breadcrumb-mode t)
    ;; completion
    (lsp-completion-mode t)
    ;; diagnostics
    (lsp-diagnostics-mode t)
    ;; docs
    (lsp-doc-buffer)
    ;; highlights
    (lsp-semantic-tokens-mode -1)
    ;; lens
    (lsp-lens-mode -1)
    ;; modeline
    (lsp-modeline-code-actions-mode -1)
    (lsp-modeline-diagnostics-mode -1)
    (lsp-modeline-workspace-status-mode -1)
    ;; ui
    (lsp-ui-mode t)
    (lsp-ui-doc-mode t)
    (lsp-ui-sideline-mode -1)))

;;; lsp-diagnostics
(use-package lsp-diagnostics)

;;; lsp-ui
(use-package lsp-ui
  :hook (lsp-ui-mode . lsp-ui/lsp-ui-mode-setup)
  :preface
  (defun lsp-ui/lsp-ui-mode-setup ()
    (lsp-ui-doc-frame-mode -1)))

;;; lsp-ui-peek
(use-package lsp-ui-peek
  :bind (:map lsp-ui-peek-mode-map
              ("M-p" . 'lsp-ui-peek--select-prev-file)
              ("M-n" . 'lsp-ui-peek--select-next-file)
              ("n" . 'lsp-ui-peek--select-next)
              ("p" . 'lsp-ui-peek--select-prev)))

;;; lsp-treemacs
(use-package lsp-treemacs
  :config
  (lsp-treemacs-sync-mode -1)
  :bind (:map enomem-mode-map
              ("M-s M-l t c" . lsp-treemacs-call-hierarchy)
              ("M-s M-l t e" . lsp-treemacs-errors-list)
              ("M-s M-l t f" . lsp-treemacs-quick-fix)
              ("M-s M-l t r" . lsp-treemacs-references)
              ("M-s M-l t s" . lsp-treemacs-symbols)
              ("M-s M-l t t" . lsp-treemacs-type-hierarchy)))

;;; lsp-origami
(use-package lsp-origami)

(provide 'enomem/en-lsp)
