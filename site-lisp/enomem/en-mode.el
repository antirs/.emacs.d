;;; mmm
(use-package mmm-mode
  :config
  (setq mmm-global-classes nil)
  :bind (:map enomem-mode-map
              ("M-s M-m f" . mmm-mode-off)
              ("M-s M-m n" . mmm-mode-on)
              ("M-s M-m p" . 'mmm-parse-buffer)))

(use-package mmm-cweb
  :config
  (add-to-list 'mmm-mode-ext-classes-alist
               '(latex-mode "\\.w\\'" cweb)))

;;; mmm-noweb
(use-package mmm-noweb
  :config
  (add-to-list 'mmm-mode-ext-classes-alist
               '(latex-mode "\\.nw\\'" noweb)))

;;; polymode
(use-package polymode
  :bind (:map polymode-map
              ("M-n E" . polymode-set-exporter)
              ("M-n e" . polymode-export)))

;;; poly-markdown
(use-package poly-markdown
  :hook (markdown-mode . poly-markdown-mode)
  :hook (poly-markdown-mode . poly-markdown/poly-markdown-setup)
  :bind (:map poly-markdown-mode-map
              ("C-c '" . markdown-edit-code-block))
  :preface
  (defun poly-markdown/poly-markdown-setup ()
    (setq browse-url-browser-function 'browse-url-firefox)))

;;; poly-rst
(use-package poly-rst
  :hook (rst-mode . polymode-minor-mode)
  :hook (poly-rst-mode . poly-rst/poly-rst-setup)
  :preface
  (defun poly-rst/poly-rst-setup ()
    (setq browse-url-browser-function 'browse-url-firefox)))

;;; poly-R
(use-package poly-R
  :mode (("\\.Snw\\'" . poly-noweb+r-mode)
         ("\\.Rnw\\'" . poly-noweb+r-mode)
         ("\\.Rmd\\'" . poly-markdown+r-mode)))

;;; poly-noweb
(use-package poly-noweb
  :mode ("\\.nw\\'" . latex-mode)
  :config
  (delete '("\\.nw\\'" . poly-noweb-mode) auto-mode-alist))

;;; poly-wdl
(use-package poly-wdl :disabled
  :hook (wdl-mode . polymode-minor-mode))

(provide 'enomem/en-mode)
