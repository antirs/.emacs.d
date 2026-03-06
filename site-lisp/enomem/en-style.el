;;; enomem/en-style
(use-package enomem/en-style :load-path "site-lisp" :defer t
  :config
  (setq visible-bell t)
  (menu-bar-mode -1)
  (scroll-bar-mode -1)
  (tool-bar-mode t)
  (blink-cursor-mode -1)
  (setq custom-safe-themes
        '("ee7dc13d93b277d28d58a32d95dcbcbb11271de71ef74cd94d89bda68a140d9a"))
  ;; font
  (add-to-list 'default-frame-alist '(font . "Liberation Mono 12"))
  ;; window-system
  (when (window-system)
    (add-to-list 'default-frame-alist '(font . "NotoSans Mono 10"))))

;;; arjen-theme
(use-package arjen-theme
  :config
  (load-theme 'arjen t t)
  :custom-face
  ;; generic
  (cursor
   ((t (:background "green"))))
  (font-lock-builtin-face
   ((t (:foreground "#d3ebe9"))))
  (font-lock-comment-delimiter-face
   ((t (:foreground "#808080"))))
  (font-lock-comment-face
   ((t (:foreground "#808080"))))
  (font-lock-constant-face
   ((t (:foreground "#ca5f6c"))))
  (font-lock-constant-face
   ((t (:foreground "#ca5f6c"))))
  (font-lock-doc-face
   ((t (:foreground "#808080"))))
  (font-lock-function-name-face
   ((t (:foreground "#99d1ce" :weight bold))))
  (font-lock-keyword-face
   ((t (:foreground "#d3ebe9" :weight bold))))
  (font-lock-preprocessor-face
   ((t (:foreground "#87ffd7"))))
  (font-lock-string-face
   ((t (:foreground "#d75f87"))))
  (font-lock-type-face
   ((t (:foreground "#d3ebe9"))))
  (font-lock-variable-name-face
   ((t (:foreground "#99d1ce"))))
  (header-line
   ((t (:foreground "black" :background "gray80" :underline nil))))
  (highlight
   ((t (:background "#65a7e2" :foreground "black" :))))
  (lazy-highlight
   ((t (:background "#E52B50" :foreground "black"))))
  (link
   ((t (:foreground "magenta" :underline t :weight normal))))
  (link-visited
   ((t (:foreground "violet" :underline t :weight normal))))
  (mode-line
   ((t (:foreground "black" :background "gray80"))))
  (mode-line-buffer-id
   ((t (:foreground "blue" :background "gray5" :weight bold))))
  (mode-line-inactive
   ((t (:foreground "white" :background "gray5" ))))
  (region
   ((t (:foreground "gray80" :background "gray30"))))
  (transient-argument
   ((t (:foreground "darkblue"))))
  ;; diff
  (diff-added
   ((t (:foreground "#84f3a3" :background "000000"))))
  (diff-changed
   ((t (:foreground "darkslateblue" :background "000000"))))
  (diff-indicator-added
   ((t (:foreground "#84f3a3" :background "000000"))))
  (diff-indicator-changed
   ((t (:foreground "darkslateblue" :background "000000"))))
  (diff-indicator-removed
   ((t (:foreground "brightyellow" :background "000000"))))
  (diff-refine-added
   ((t (:foreground "black" :background "#84f3a3"))))
  (diff-refine-changed
   ((t (:foreground "black" :background "darkslateblue"))))
  (diff-refine-removed
   ((t (:foreground "black" :background "brightyellow"))))
  (diff-removed
   ((t (:foreground "brightyellow" :background "000000"))))
  ;; ediff
  (ediff-current-diff-A
   ((t (:foreground "brightyellow" :background "#070707"))))
  (ediff-current-diff-Ancestor
   ((t (:foreground "white" :background "#009591"))))
  (ediff-current-diff-B
   ((t (:foreground "#84f3a3" :background "#070707"))))
  (ediff-current-diff-C
   ((t (:foreground "black" :background "skyblue"))))
  (ediff-even-diff-A
   ((t (:foreground "black" :background "white"))))
  (ediff-even-diff-Ancestor
   ((t (:foreground "white" :background "black"))))
  (ediff-even-diff-B
   ((t (:foreground "black" :background "white"))))
  (ediff-even-diff-C
   ((t (:foreground "black" :background "white"))))
  (ediff-fine-diff-A
   ((t (:foreground "black" :background "brightyellow"))))
  (ediff-fine-diff-B
   ((t (:foreground "black" :background "#84f3a3"))))
  (ediff-fine-diff-C
   ((t (:foreground "white" :background "black"))))
  (ediff-odd-diff-A
   ((t (:foreground "black" :background "white"))))
  (ediff-odd-diff-Ancestor
   ((t (:foreground "black" :background "gray40"))))
  (ediff-odd-diff-B
   ((t (:foreground "black" :background "white"))))
  (ediff-odd-diff-C
   ((t (:foreground "black" :background "white"))))
  ;; highlight-doxygen
  (highlight-doxygen-comment
   ((t (:background "black"))))
  (highlight-doxygen-filename
   ((t (:background "black"))))
  ;; hl-line
  (hl-line
   ((t (:foreground "black" :background "purple"))))
  ;; isearch
  (isearch
   ((t (:foreground "black" :background "gray80"))))
  ;; lsp
  (lsp-headerline-breadcrumb-path-face
   ((t (:foreground "black" :background "gray80"))))
  (lsp-face-semhl-implementation
   ((t (:foreground "black" :background "#99d1ce"))))
  ;; magit-diff
  (magit-diff-added
   ((t (:foreground "black" :background "#84f3a3"))))
  (magit-diff-added-highlight
   ((t (:foreground "black" :background "#84f3a3"))))
  (magit-diff-our
   ((t (:foreground "black" :background "brightyellow"))))
  (magit-diff-our-highlight
   ((t (:foreground "black" :background "brightyellow"))))
  (magit-diff-removed
   ((t (:foreground "black" :background "brightyellow"))))
  (magit-diff-removed-highlight
   ((t (:foreground "black" :background "brightyellow"))))
  (magit-diff-their
   ((t (:foreground "black" :background "#84f3a3"))))
  (magit-diff-their-highlight
   ((t (:foreground "black" :background "#84f3a3"))))
  ;; mmm
  (mmm-code-submode-face
   ((t (:foreground "white" :background "blue"))))
  (mmm-default-submode-face
   ((t (:foreground "white" :background "darkblue"))))
  ;; org
  (org-meta-line
   ((t (:foreground "white" :background "green" :weight bold))))
  ;; org-agenda
  (org-agenda-clocking
   ((t (:foreground "black" :background "green" :weight bold))))
  (org-agenda-column-dateline
   ((t (:background "gray5"))))
  (org-agenda-date
   ((t (:background "white" :foreground "black"))))
  (org-agenda-dimmed-todo-face
   ((t (:foreground "white"))))
  (org-agenda-done
   ((t (:foreground "color-235"))))
  (org-scheduled-previously
   ((t (:foreground "yellow" :weight medium))))
  (org-scheduled-today
   ((t (:foreground "palegreen" :weight bold))))
  (org-super-agenda-header
   ((t (:background "#446393" :foreground "white" :weight bold))))
  (org-time-grid
   ((t (:foreground "color-238"))))
  (org-warning
   ((t (:foreground "black" :background "brightyellow" :weight bold))))
  ;; org-babel
  (org-block-begin-line
   ((t (:background "#51acab" :foreground "black"))))
  (org-block-end-line
   ((t (:background "black" :foreground "#51acab" :underline t))))
  (org-meta-line
   ((t (:background "black" :foreground "gray35"))))
  ;; org-colview
  (org-column
   ((t (:background "grey5" :foreground "white" :weight normal))))
  (org-column-title
   ((t (:background "gray5" :foreground "blue" :underline t))))
  ;; org-element
  (outline-1
   ((t (:background "gray15" :foreground "#7985ac"))))
  (outline-2
   ((t (:background "gray15" :foreground "#7985ac"))))
  (outline-3
   ((t (:background "gray15" :foreground "#7985ac"))))
  (outline-4
   ((t (:background "gray15" :foreground "#7985ac"))))
  ;; org-extra-emphasis
  (org-extra-emphasis-01
   ((t (:background "yellow" :foreground "black"))))
  ;; org-habit
  (org-habit-alert-face
   ((t (:foreground "black" :background "#f5f946"))))
  (org-habit-alert-future-face
   ((t (:foreground "black" :background "#fafca9"))))
  (org-habit-clear-face
   ((t (:foreground "black" :background "#8270f9"))))
  (org-habit-clear-future-face
   ((t (:foreground "black" :background "#d6e4fc"))))
  (org-habit-overdue-face
   ((t (:foreground "black" :background "#f9372d"))))
  (org-habit-overdue-future-face
   ((t (:foreground "black" :background "#fc9590"))))
  (org-habit-ready-face
   ((t (:foreground "black" :background "#4df946"))))
  (org-habit-ready-future-face
   ((t (:foreground "black" :background "#acfca9"))))
  ;; org-roam
  (org-roam-header-line
   ((t (:background "pink" :foreground "black"))))
  ;; smerge
  (smerge-refined-added
   ((t (:foreground "black" :background "#84f3a3"))))
  (smerge-refined-removed
   ((t (:foreground "black" :background "brightyellow"))))
  ;; treemacs
  (treemacs-root-face
   ((t (:foreground "black" :background "brightgreen"))))
  (treemacs-root-remote-disconnected-face
   ((t (:foreground "white" :background "grey30"))))
  (treemacs-root-remote-face
   ((t (:foreground "black" :background "green"))))
  ;; w3m
  (w3m-anchor
   ((t (:foreground "magenta" :underline nil :weight normal))))
  (w3m-header-line-content
   ((t (:foreground "lightgoldenrod" :background "gray5"))))
  (w3m-header-line-title
   ((t (:foreground "magenta" :background "gray5" :weight bold))))
  (w3m-image-anchor
   ((t (:foreground "black" :background "magenta" :weight normal))))
  (w3m-tab-selected
   ((t (:foreground "black" :background "white" :weight bold))))
  (w3m-tab-unselected-retrieving
   ((t (:foreground "white" :background "blue"))))
  ;; whitespace
  (whitespace-line
   ((t (:background "gray5"))))
  (whitespace-space
   ((t (:background "gray15"))))
  (whitespace-tab
   ((t (:background "gray10"))))
  ;; yas
  (yas-field-highlight-face
   ((t (:background "white" :foreground "gray25")))))

;;; hi-lock
(use-package hi-lock
  :config
  (defface en-hi-red '((t (:inherit 'hi-yellow :underline "black" :bold t))) "")
  (defface en-hi-purple '((t (:inherit 'hi-yellow :foreground "white" :background "purple2" :underline "black" :bold t))) "")
  (defface en-hi-aquamarine '((t (:inherit 'hi-aquamarine))) "")
  (defface en-hi-purple-b '((t (:inherit 'hi-black-b :foreground "purple3" :background "#FFFFFF" :bold t :underline "black"))) "")
  (defface en-hi-pink '((t (:inherit 'hi-pink))) "")
  (defface en-hi-blue '((t (:inherit 'hi-black-b :foreground "black" :background "#65a7e2" :underline "black"))) "")
  (defface en-hi-salmon '((t (:inherit 'hi-salmon))) "")
  (defface en-hi-green '((t (:inherit 'hi-green))) "")
  (defface en-hi-gray '((t (:inherit 'hi-blue))) "")
  (defface en-hi-white '((t (:inherit 'hi-red :foreground "#ffffff" :background "black" :underline "black"))) ""))

(provide 'enomem/en-style)
