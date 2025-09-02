;;; plantuml-mode
(use-package plantuml-mode
  :mode ("\\.\\(puml\\|plantuml\\)\\'" . plantuml-mode)
  :init
  (setq plantuml-default-exec-mode 'jar)
  (setq plantuml-server-url "http://localhost:8080")
  (setq plantuml-jar-path "/home/enomem/.local/share/plantuml/lib/plantuml.jar")
  :hook (plantuml-mode . enomem/plantuml-mode/plantuml-mode-setup)
  :preface
  (defun enomem/plantuml-mode/plantuml-mode-setup ()
    (electric-indent-local-mode -1)
    (setq indent-tabs-mode 'only)))

;;; gnuplot
(use-package gnuplot
  :mode ("\\.gp\\'" . gnuplot-mode))

;;; enomem/en-edit
(use-package enomem/en-edit :load-path "site-lisp"
  :hook (plantuml-mode . en-edit/plantuml-mode-setup)
  :preface
  (defun en-edit/plantuml-mode-setup ()
    (setq indent-tabs-mode t)
    (setq whitespace-style relaxed-tab-whitespace-style)
    (en-edit/whitespace-mode-reload)))

(provide 'enomem/en-graphics)
