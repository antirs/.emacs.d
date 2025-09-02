;;; hideshow
(use-package hideshow
  :bind (:map hs-minor-mode-map
              ("M-g M-h b" . hs-hide-block)
              ("M-g M-h h" . hs-hide-all)
              ("M-g M-h l" . hs-hide-level)
              ("M-g M-h s" . hs-show-all)
              ("M-g M-h t" . hs-toggle-hiding)
              ("M-g M-h u" . hs-show-block)))

;;; origami
(use-package origami
  :bind (:map origami-mode-map
              ("M-g M-o C" . 'origami-close-all-nodes)
              ("M-g M-o M-b" . 'origami-backward-fold-same-level)
              ("M-g M-o M-c" . 'origami-close-node)
              ("M-g M-o M-f" . 'origami-forward-fold-same-level)
              ("M-g M-o M-n" . 'origami-next-fold)
              ("M-g M-o M-o" . 'origami-open-node)
              ("M-g M-o M-p" . 'origami-previous-fold)
              ("M-g M-o O" . 'origami-open-all-nodes)
              ("M-g M-o c" . 'origami-close-node-recursively)
              ("M-g M-o o" . 'origami-open-node-recursively)
              ("M-g M-o t" . 'origami-toggle-node)
              ("M-g M-o T" . 'origami-toggle-all-nodes)))

(provide 'enomem/en-fold)
