;;; pcap-mode
(use-package pcap-mode
  :bind (:map pcap-mode-map
              ("C-m" . pcap-mode-view-pkt-contents)))

(provide 'enomem/en-net)
