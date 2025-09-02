;;; system/tags
(use-package system/tags :load-path "site-lisp")

;;; etags
(use-package etags
  :init
  (make-variable-buffer-local 'xref-backend-functions)
  :hook (prog-mode . etags/etags-setup)
  :preface
  (defun etags/etags-setup ()
    (add-to-list 'xref-backend-functions 'etags--xref-backend)))

;;; ggtags
(use-package ggtags
  :config
  (setenv "GTAGSLIBPATH" "/home/enomem/.tags.d/c++")
  (setenv "GTAGSTHROUGH" "true")
  (setq ggtags-auto-jump-to-match nil)
  (setq ggtags-enable-navigation-keys nil)
  :bind (:map ggtags-mode-map
              ("M-." . nil)
              ("\M-." . nil)
              ("M-," . nil)
              ("M-n" . nil)
              ("M-p" . nil)
              ("M-]" . nil)
              ("M-s g f d" . ggtags-find-definition)
              ("M-s g f e" . ggtags-find-tag-regexp)
              ("M-s g f f" . ggtags-find-file)
              ("M-s g f r" . ggtags-find-reference)
              ("M-s g f s" . ggtags-find-other-symbol)
              ("M-s g f t" . ggtags-find-tag-dwim)
              ("M-s g q" . ggtags-navigation-mode-abort))
  :bind (:map ggtags-navigation-map
              ("M-s g q" . ggtags-navigation-mode-abort)))

;;; xcscope
(use-package xcscope
  :config
  (setq cscope-program "cscope")
  :bind (:map cscope-list-entry-keymap
              ("M-P" . 'cscope-history-backward-result)
              ("M-N" . 'cscope-history-forward-result)
              ("M-p" . 'cscope-history-backward-file)
              ("M-n" . 'cscope-history-forward-file))
  :bind (:map cscope-minor-mode-keymap
              ("M-." . nil)
              ("M-," . nil)
              ("M-]" . nil)
              ("M-s c ," . cscope-pop-mark)
              ("M-s c B" . cscope-display-buffer)
              ("M-s c D" . cscope-dired-directory)
              ("M-s c I" . cscope-index-files)
              ("M-s c f C" . cscope-find-called-functions)
              ("M-s c f a" . cscope-find-assignments-to-this-symbol)
              ("M-s c f c" . cscope-find-functions-calling-this-function)
              ("M-s c f d" . cscope-find-global-definition)
              ("M-s c f e" . cscope-find-egrep-pattern)
              ("M-s c f f" . cscope-find-this-file)
              ("M-s c f g" . cscope-find-global-definition)
              ("M-s c f i" . cscope-find-files-including-file)
              ("M-s c f s" . cscope-find-this-symbol)
              ("M-s c f t" . cscope-find-this-text-string)
              ("M-s c q" . 'cscope-quit)))

(provide 'enomem/en-tags)
