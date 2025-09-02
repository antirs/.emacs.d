;;; company
(use-package company
  :init
  (setq company-backends nil)
  (add-to-list 'company-backends 'company-yasnippet)
  (add-to-list 'company-backends 'company-files)
  (add-to-list 'company-backends 'company-capf)
  (make-variable-buffer-local 'company-backends)
  :config
  (setq company-idle-delay nil)
  :bind (:map company-mode-map
              ("M-i M-c" . company-complete)
              ("C-M-i" . company-complete))
  :bind (:map company-active-map
              ("M-j" . company-select-next-or-abort)
              ("M-k" . company-select-previous-or-abort))
  :bind (:map company-search-map
              ("M-j" . company-select-next)
              ("M-k" . company-select-previous))
  :preface
  (defun company/company-complete-workaround ()
    "Insert the common part of all candidates or the current selection.
The first time this is called, the common part is inserted, the second
time, or when the selection has been changed, the selected candidate is
inserted."
    (interactive)
    (when (company-manual-begin)
      (call-interactively 'company-complete-selection)
      (call-interactively 'company-complete-common)
      (when company-candidates
        (setq this-command 'company-complete-common)))))

(provide 'enomem/en-company)
