(require 'mm-url)
(defadvice mm-url-insert (after DE-convert-atom-to-rss () )
  "Converts atom to RSS by calling xsltproc."
  (when (re-search-forward "xmlns=\"http://www.w3.org/.*/Atom\""
                           nil t)
    (goto-char (point-min))
    (call-process-region (point-min) (point-max)
                         "xsltproc"
                         t t nil
                         (expand-file-name "~/.emacs.d/site-lisp/enomem/etc/atom2rss.xsl") "-")
    (goto-char (point-min))))

(ad-activate 'mm-url-insert)

(provide 'atom2rss)
