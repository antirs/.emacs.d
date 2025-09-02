;;; system/tex
(use-package system/build :load-path "site-lisp")

;;; make-mode
(use-package make-mode)

;;; cmake-mode
(use-package cmake-mode
  :config
  (setq cmake-tab-width 4)
  :bind (:map enomem-mode-map
              ("M-s h c" . cmake-help)
              ("M-c c c" . cmake-command-run)))

;;; cmake-ide
(use-package cmake-ide :disabled
  :bind (:map enomem-mode-map
              ("M-c C c" . cmake-ide-maybe-run-cmake)
              ("M-c C l" . cmake-ide-load-db)
              ("M-c C r" . cmake-ide-maybe-start-rdm)
              ("M-c C s" . en-build/cmake-set-build-type))
  :preface
  (defun en-build/cmake-set-build-type ()
    (interactive)
    (let* ((ask-types '("release" "debug" "asan"))
           (ask-ccache '(t nil))
           (type (completing-read "Build type: " ask-types))
           (ccache (completing-read "Use ccache: " ask-ccache))
           (ccache-arg (if ccache "-DCMAKE_CXX_COMPILER_LAUNCHER=ccache" ""))
           (database-arg "-DCMAKE_EXPORT_COMPILE_COMMANDS=ON")
           (prefix-arg (concat "-DCMAKE_INSTALL_PREFIX="
                               (expand-file-name ".install"
                                                 default-directory))))
      (setq cmake-ide-cmake-args
            (list ccache-arg database-arg prefix-arg
                  (concat "-DCMAKE_BUILD_TYPE=" type))))))

;;; ninja-mode
(use-package ninja-mode)

;;; meson-mode
(use-package meson-mode
  :config
  (setq meson-markdown-docs-dir "~/docs/meson-docs/markdown")
  :bind (:map meson-mode-map
              ("M-s h m" . 'meson-lookup-doc)))

;;; gn-mode
(use-package gn-mode
  :mode (("\\.gn\\'" . gn-mode)))

;;; bazel
(use-package bazel)

;;; enomem/en-company-build
(use-package enomem/en-company-build :load-path "site-lisp")

;;; enomem/en-edit
(use-package enomem/en-edit :load-path "site-lisp"
  :hook (makefile-mode . en-edit/makefile-mode-edit-setup)
  :hook (cmake-mode . en-edit/cmake-mode-setup)
  :preface
  (defun en-edit/makefile-mode-edit-setup ()
    (setq indent-tabs-mode t)
    (setq whitespace-style tab-whitespace-style)
    (en-edit/whitespace-mode-reload))
  (defun en-edit/cmake-mode-setup ()
    (setq whitespace-style space-whitespace-style)
    (en-edit/whitespace-mode-reload)))

(provide 'enomem/en-build)
