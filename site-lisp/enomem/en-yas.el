;;; yasnippet
(use-package yasnippet
  :config
  (add-to-list 'yas-snippet-dirs "~/.emacs.d/site-lisp/enomem/snippets")
  (yas-reload-all)
  :bind (:map yas-minor-mode-map
              ("C-i" . nil)
              ("C-M-i" . nil)
              ("M-s M-y e" . 'yas-expand)
              ("M-s M-y r" . 'yas-reload-all))
  :preface
  (defun create-snippet (filename)
    (interactive "s")
    (let ((mode (symbol-name major-mode)))
      (find-file (format "~/.emacs.d/site-lisp/enomem/snippets/%s/%s"
                         mode filename))
      (snippet-mode))))

;;; ivy-yasnippet
(use-package ivy-yasnippet
  :bind (:map yas-minor-mode-map
              ("M-u M-y" . 'ivy-yasnippet)))

(provide 'enomem/en-yas)
