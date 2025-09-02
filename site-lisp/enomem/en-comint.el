;;; comint
(use-package comint
  :config
  (setq comint-password-prompt-regexp
        (concat "\\(\\([Oo]ld \\|[Nn]ew \\|^\\)[Pp]assword\\|"
                "Enter token\\|"
                "Enter passphrase for.*\\|"
                "Enter password\\|"
                "Enter PIN for '.*'\\|"
                "User PIN\\|"
                "Please enter User PIN\\|"
                "Please enter the current PIN\\|"
                "Please enter the new PIN\\|"
                "Please enter the new PIN again\\|"
                "Please enter user PIN\\|"
                "Please enter SO PIN\\|"
                "Please reenter user PIN\\|"
                "Please reenter SO PIN\\|"
                "Please enter the new SO PIN\\|"
                "Please enter the new SO PIN (again)\\|"
                "Please enter Security officer PIN \\[Security Officer PIN\\]\\|"
                "Enter Encryption Password\\|"
                "Verifying - Enter Encryption Password"
                "\\):\\s *\\'"))
  :bind (:map comint-mode-map
              ("M-p" . comint-previous-input)
              ("M-n" . comint-next-input)))

;;; isend-mode
(use-package isend-mode
  :config
  (setq isend-send-region-function nil)
  :bind (:map enomem-mode-map
              ("M-i M-s M-b" . 'isend-send-buffer)
              ("M-i M-s M-d" . 'isend-send-defun)
              ("M-i M-s M-l" . 'isend-send-line-function)
              ("M-i M-s M-r" . 'isend-send-region)
              ("M-i M-s M-s" . 'isend-send)
              ("M-i M-s a" . 'isend-associate)
              ("M-i M-s d" . 'isend-display-buffer))
  :preface
  (defun en-comint/isend-send-region ()
    (interactive)
    (let* ((process (get-buffer-process isend--command-buffer)))
      (comint-send-region process (region-beginning) (region-end)))))

(provide 'enomem/en-comint)
