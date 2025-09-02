;;; debian-ispell
(use-package debian-ispell :load-path "site-lisp/system/spell/debian-ispell")

;;; festival
(use-package festival :load-path "site-lisp/system/spell/festival"
  :commands run-festival)

(provide 'system/spell)
