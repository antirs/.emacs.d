(defun open-line-above (arg)
  (interactive "p")
  (beginning-of-line)
  (open-line 1)
  (indent-according-to-mode))

(defun open-line-below (arg)
  (interactive "p")
  (end-of-line)
  (newline)
  (indent-according-to-mode))

(defun backward-kill-line (arg)
  (interactive "p")
  (kill-line (- 1 arg)))

(defun mark-whole-line (arg)
  (interactive "p")
  (beginning-of-line)
  (push-mark (line-beginning-position) t nil)
  (setq mark-active 1))

(defun cut-line-or-region (arg)
  ""
  (interactive "p")
  (if (region-active-p)
      (kill-region (region-beginning) (region-end))
    (kill-region (line-beginning-position) (line-beginning-position 2))))
;;(global-set-key [remap kill-region] 'cut-line-or-region)

(defun copy-line-or-region (arg)
  ""
  (interactive "p")
  (if (region-active-p)
      (kill-ring-save (region-beginning) (region-end))
    (kill-ring-save (line-beginning-position) (line-beginning-position 2))))
;;(global-set-key [remap kill-ring-save] 'cut-line-or-region)

(defun duplicate-current-line-or-region (arg)
  "Duplicates the current line or region ARG times.
If there's no region, the current line will be duplicated. However, if
there's a region, all lines that region covers will be duplicated."
  (interactive "p")
  (let (beg end (origin (point)))
    (if (and mark-active (> (point) (mark)))
        (exchange-point-and-mark))
    (setq beg (line-beginning-position))
    (if mark-active
        (exchange-point-and-mark))
    (setq end (line-end-position))
    (let ((region (buffer-substring-no-properties beg end)))
      (dotimes (i arg)
        (goto-char end)
        (newline)
        (insert region)
        (setq end (point)))
      (goto-char (+ origin (* (length region) arg) arg)))))

(provide 'editline)
