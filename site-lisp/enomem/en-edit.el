;;; isearch
(use-package isearch
  :bind (:map enomem-mode-map
              ("M-s ." . 'isearch-forward-symbol-at-point)
              ("M-s M-." . 'isearch-forward-thing-at-point)))

;;; whitespace
(use-package whitespace
  :config
  (setq space-whitespace-style
        '(face
          indentation::space
          ;; lines
          space-after-tab::space
          space-before-tab::space
          tabs
          trailing))
  (setq tab-whitespace-style
        '(face
          indentation::tab
          ;; lines
          space-after-tab::tab
          space-before-tab::tab
          spaces
          trailing))
  (setq relaxed-space-whitespace-style
        '(face
          ;; lines
          space-after-tab::space
          space-before-tab::space
          tabs
          trailing))
  (setq relaxed-tab-whitespace-style
        '(face
          ;; lines
          space-after-tab::tab
          space-before-tab::tab
          spaces
          trailing))
  (setq whitespace-space-regexp "^\\( +\\| +\t+\\)")
  :preface
  (defun en-edit/fill-120 ()
    (setq fill-column 120)
    (setq whitespace-line-column 120))
  (defun en-edit/whitespace-mode-reload ()
    (whitespace-mode -1)
    (whitespace-mode t)))

(use-package whitespace
  :bind (:map enomem-mode-map
              ("M-u M-e w c" . whitespace-cleanup)
              ("M-u M-e w l" . delete-trailing-lines)
              ("M-u M-e w r" . whitespace-cleanup-region)
              ("M-u M-e w w" . delete-trailing-whitespace)))

;;; expand-region
(use-package expand-region
  :bind (:map enomem-mode-map
              ("M-u M-e M-e" . er/expand-region)
              ("M-u M-e e c" . er/mark-comment)
              ("M-u M-e e d" . er/mark-defun)
              ("M-u M-e e i" . er/mark-inside-pairs)
              ("M-u M-e e o" . er/mark-outside-pairs)
              ("M-u M-e e p" . er/mark-paragraph)
              ("M-u M-e e s" . er/mark-sentence)))

;;; multiple-cursors
(use-package multiple-cursors
  :bind (:map enomem-mode-map
              ("M-u M-e m b" . mc/edit-beginnings-of-lines)
              ("M-u M-e m d" . mc/mark-all-like-this-dwim)
              ("M-u M-e m e" . mc/edit-ends-of-lines)
              ("M-u M-e m f" . mc/mark-all-like-this-in-defun)
              ("M-u M-e m l" . mc/edit-lines)
              ("M-u M-e m m" . mc/mark-all-like-this)
              ("M-u M-e m n" . mc/mark-next-like-this)
              ("M-u M-e m p" . mc/mark-previous-like-this)
              ("M-u M-e m s" . mc/mark-sgml-tag-pair)))

;;; paredit
(use-package paredit :demand
  :bind (:map paredit-mode-map
              ("M-d" . nil)
              ("M-q" . nil)
              ("M-r" . nil)
              ("M-s" . nil)
              ("M-?" . nil)
              ("M-s (" . paredit-backward-slurp-sexp)
              ("M-s )" . paredit-forward-slurp-sexp)
              ("M-s }" . paredit-forward-barf-sexp)
              ("M-s {" . paredit-backward-barf-sexp)
              ("M-s q" . paredit-reindent-defun)
              ("M-s r" . paredit-raise-sexp)
              ("M-s s" . paredit-splice-sexp)
              ("M-s j" . paredit-splice-sexp-killing-forward)
              ("M-s k" . paredit-splice-sexp-killing-backward)
              ("M-s y" . paredit-copy-as-kill)))

;;; edit-indirect
(use-package edit-indirect
  :bind (:map enomem-mode-map
              ("M-u M-e M-i" . 'edit-indirect-region)))

;;; separedit
(use-package separedit
  :config
  (setq separedit-preserve-string-indentation t)
  :bind (:map enomem-mode-map
              ("M-u M-e M-S" . separedit)))

(provide 'enomem/en-edit)
