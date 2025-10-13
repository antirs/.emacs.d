;;; system/tex
(use-package system/tex :load-path "site-lisp"
  :config
  (delete '("\\.w$" . cweb-mode) auto-mode-alist)
  (delete '("\\.ch$" . cweb-mode) auto-mode-alist)
  (setq auto-mode-alist (cons '("\\.w$" . latex-mode) auto-mode-alist))
  (setq auto-mode-alist (cons '("\\.ch$" . latex-mode) auto-mode-alist))
  (use-package ltx-help
    :after latex
    :bind (:map LaTeX-mode-map
                ("M-s M-H" . latex-help))))

;;; tex-mode
(use-package tex-mode
  :config
  (setq TeX-parse-self t)
  (setq TeX-view-program-list
        '(("Zathura"
           ("zathura "
            " --synctex-forward %n:0:%b -x \"emacsclient +%{line}:%{column} %{input}\" "
            " %o")
           "zathura")))
  (setq TeX-view-program-selection
        '(((output-dvi has-no-display-manager)
           "dvi2tty")
          ((output-dvi style-pstricks)
           "dvips and gv")
          (output-dvi "xdvi")
          (output-pdf "Zathura")
          (output-html "xdg-open"))))

;;; latex
(use-package latex
  :config
  (setq tex-command "latex -shell-escape")
  (setq tex-command-switches
        "-synctex=1 -interaction=nonstopmode -shell-escape -file-line-error")
  (setq tex-compile-command
        `(,(concat "pdf" . #1=(tex-command
                               " -shell-escape " tex-command-switches " "
                               (if (< 0 (length tex-start-commands))
                                   (shell-quote-argument tex-start-commands))
                               " %f"))
          #2=(t "%r.pdf")))
  (setq LaTeX-command "latex -shell-escape")
  (setq latexmk-command
        `("LatexMk command" ,(concat "latexmk -pdf -shell-escape "
                                     tex-command-switches " %t")
          TeX-run-TeX nil (plain-tex-mode latex-mode doctex-mode)
          :help "Run LatexMk"))
  (setq latexmk-compile-command
        `(,(concat "latexmk" . #1=(" -shell-escape " tex-command-switches " "
                                   " %f"))
          #2=(t "%r.pdf")))
  (add-to-list 'TeX-command-list latexmk-command)
  (add-to-list 'tex-compile-commands tex-compile-command)
  (add-to-list 'tex-compile-commands latexmk-compile-command)
  :hook (LaTeX-mode . latex/latex-mode-setup)
  :bind (:map LaTeX-mode-map
              ("C-c C-c" . TeX-command-master)
              ("M-c p c" . preview-clearout-buffer)
              ("M-c p p" . preview-at-point)
              ("M-c t c" . tex-compile)
              ("M-c t v" . TeX-view)
              ("M-s M-n" . TeX-next-error)
              ("M-s M-p" . TeX-previous-error))
  :preface
  (defun latex/latex-mode-setup ()
    (LaTeX-math-mode t)
    (TeX-fold-mode t)
    (TeX-source-correlate-mode t)))

;;; auctex
(use-package auctex :no-require
  :ensure auctex
  :config
  ;; preview
  (use-package preview))

;;; reftex
(use-package reftex
  :config
  (setq reftex-plug-into-AUCTeX t)
  (setq reftex-default-bibliography '("~/.org/bibliography/biblio.bib"
                                      "~/.org/bibliography/literature/literature.bib"
                                      "~/.org/bibliography/web/web.bib"))
  :bind (:map reftex-mode-map
              ("M-s l c" . 'reftex-citation))
  :hook (LaTeX-mode . reftex-mode-setup)
  :preface
  (defun reftex-mode-setup ()
    (reftex-mode t)))

;;; reftex-sel
(use-package reftex-sel
  :config
  :bind (:map reftex-select-bib-mode-map
              ("M-p" . 'reftex-select-previous)
              ("M-n" . 'reftex-select-next)))

;;; bibtex
(use-package bibtex
  :config
  (setq bibtex-completion-notes-path "~/.org/bibliography/_notes")
  (setq bibtex-completion-notes-template-multiple-files "* ${title} :${=type=}:\n:PROPERTIES:\n:header-args: :results output verbatim silent wrap\n:header-args+: :noweb no-export\n:header-args+: :comments noweb\n:header-args+: :exports code\n:header-args+: :eval never-export\n:header-args:bash: :session *${=key=}*\n:END:\n\nSee [[cite:&${=key=}]]\n")
  (setq bibtex-completion-additional-search-fields '(keywords))
  (setq bibtex-completion-pdf-open-function
        (lambda (fpath)
          (call-process "open" nil 0 nil fpath)))
  :bind (:map bibtex-mode-map
              ("M-u b e" . 'bibtex-entry)
              ("M-u b y" . 'bibtex-yank)))

;;; bibtex-completion
(use-package bibtex
  :config
  (setq bibtex-completion-bibliography
        '("~/.org/bibliography/biblio.bib"
          "~/.org/bibliography/literature/literature.bib"
          "~/.org/bibliography/web/web.bib"))
  (setq bibtex-completion-library-path '("~/.org/bibliography/_pdf"))
  (setq bibtex-completion-notes-path "~/.org/bibliography/_notes")
  (setq bibtex-completion-notes-template-multiple-files "* ${title} :${=type=}:\n:PROPERTIES:\n:header-args: :results output verbatim silent wrap\n:header-args+: :noweb no-export\n:header-args+: :comments noweb\n:header-args+: :exports code\n:header-args+: :eval never-export\n:header-args:bash: :session *${=key=}*\n:END:\n\nSee [[cite:&${=key=}]]\n")
  (setq bibtex-completion-additional-search-fields '(keywords))
  (setq bibtex-completion-pdf-open-function
        (lambda (fpath)
          (call-process "open" nil 0 nil fpath))))

;;; latexdiff
(use-package latexdiff)

;;; enomem/en-lsp-asy
(use-package enomem/en-lsp-asy :load-path "site-lisp")

;;; enomem/en-fold
(use-package enomem/en-fold :load-path "site-lisp"
  :hook (TeX-mode . origami-mode))

(provide 'enomem/en-tex)
