;;; texinfo
(use-package texinfo)

;;; adoc-mode
(use-package adoc-mode)

;;; markdown-mode
(use-package markdown-mode
  ;; :mode (("\\.md\\'" . markdown-mode)
  ;;        ("\\.markdown\\'" . markdown-mode))
  :config
  (setq markdown-xhtml-header-content
        (concat "<script type=\"text/javascript\" async "
                "src=\"file:///usr/share/mathjax/"
                "MathJax.js?config=TeX-MML-AM_CHTML\">"
                "</script>"))
  :hook (markdown-mode . markdown-mode/markdown-mode-setup)
  :preface
  (defun markdown-mode/markdown-mode-setup ()
    (setq fill-column 80)
    (setq whitespace-line-column 80)
    (setq whitespace-style relaxed-space-whitespace-style)
    (en-edit/whitespace-mode-reload)))

;;; rst
(use-package rst
  ;; :mode (("\\.rst\\'" . markdown-mode))
  :hook (rst-mode . rst/rst-mode-setup)
  :preface
  (defun rst/rst-mode-setup ()
    (setq fill-column 80)
    (setq whitespace-line-column 80)
    (setq whitespace-style relaxed-space-whitespace-style)
    (en-edit/whitespace-mode-reload)))

;;; jinja2-mode
(use-package jinja2-mode)

;;; pandoc-mode
(use-package pandoc-mode
  :hook (markdown-mode . pandoc-mode))

(provide 'enomem/en-docs)
