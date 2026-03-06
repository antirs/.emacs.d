;;; dired
(use-package dired
  :config
  (setq dired-listing-switches "-vaBDhl --dired --group-directories-first")
  (setq dired-use-ls-dired t)
  :bind (:map dired-mode-map
              ("M-u M-d o" . dired/dired-open-file))
  :preface
  (defun dired/dired-open-file ()
    (interactive)
    (let* ((file (dired-get-filename nil t)))
      (call-process "xdg-open" nil 0 nil file))))

;;; dired-x
(use-package dired-x)

(provide 'enomem/en-dired)
