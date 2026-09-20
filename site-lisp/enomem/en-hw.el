;;; system/hw
(use-package system/hw :load-path "site-lisp"
  :mode ("\\.\\(bsv\\|bs\\)\\'" . bsv-mode))

;;; verilog-mode
(use-package spice-mode
  :mode ("\\.\\(cir\\|ckt\\|sp\\)\\'" . spice-mode)
  :config
  (add-to-list 'spice-simulator-alist
               '("ngspice" "ngspice -b" ""
                 ("\\s-*Error[	 ]+on[ 	]+line[	 ]+\\([0-9]+\\) +:.+" 0 1 nil
                  (buffer-file-name))
                 ("Circuit: \\(.*\\)$" 1)))
  (setq spice-simulator "ngspice")
  (setq spice-waveform-viewer "Nutmeg")
  (setq spice-highlight-keywords t))

;;; verilog-mode
(use-package verilog-mode
  :config
  (setq verilog-linter "verilator --lint-only -Wall -f ")
  :mode ("\\.v\\'" . verilog-mode))

;;; vhdl-mode
(use-package vhdl-mode)

(provide 'enomem/en-hw)
