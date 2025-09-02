;;; system/math
;; (use-package system/math :load-path "site-lisp"
;;   :init
;;   (setq imaxima-use-maxima-mode-flag t)
;;   :config
;;   (use-package singular :load-path "site-lisp"
;;     :init
;;     (setq singular-emacs-home-directory "/home/enomem/.emacs.d/site-lisp/system/math/singular")
;;     (setenv "ESINGULAR_EMACS_DIR" singular-emacs-home-directory)
;;     (setenv "SINGULAR_IDX_FILE" "/home/enomem/.math/singular/singular-4.3.1/share/singular/singular.idx")
;;     (setenv "SINGULAR_INFO_FILE" "/home/enomem/.math/singular/singular-4.3.1/share/info/singular.info")
;;     :bind (:map enomem-mode-map
;;                 ("M-s M-H h" . 'singular-help)))
;;   (use-package emaxima :load-path "site-lisp"
;;     :bind (:map enomem-mode-map
;;                 ("M-s M-m c" . 'emaxima-update-single-cell)
;;                 ("M-s M-m s" . emaxima-tex-update-single-cell)
;;                 ("M-s M-m u" . emaxima-update-all-cells)
;;                 ("M-s M-m t" . emaxima-tex-update-all-cells))))

;;; maxima
(use-package maxima
  :mode ("\\.mac\\'" . maxima-mode)
  :init
  (setenv "MAXIMA_LISP" "sbcl")
  (setenv "TCLLIBPATH" "/usr/lib/tcltk/vtk-8.1/")
  :bind (:map maxima-mode-map
              ("M-s M-h" . 'maxima-help-at-point)
              ("M-i M-m" . 'maxima-complete)
              ("M-i M-M" . 'maxima-completion-help))
  :bind (:map inferior-maxima-mode-map
              ("M-s M-h" . 'maxima-help-at-point)
              ("M-i M-m" . 'maxima-complete)
              ("M-i M-M" . 'maxima-completion-help)))

;;; octave
(use-package octave)

;;; sage-shell-mode
(use-package sage-shell-mode)

;;; gap-mode
(use-package gap-mode
  :init
  (setq gap-executable "/usr/bin/gap"))

(provide 'enomem/en-math)
