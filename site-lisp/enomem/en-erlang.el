;;; erlang
(use-package erlang
  :bind (:map erlang-mode-map
              ("M-u M-E c" . 'erlang-compile)
              ("M-u M-E r" . 'run-erlang)
              ("M-u M-E s" . 'erlang-shell-display)))

(provide 'enomem/en-erlang)
