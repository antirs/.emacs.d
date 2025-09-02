;;; dependencies
(use-package org)
(use-package org-id)
(use-package org-protocol)

;;; org-extra-emphasis
(use-package org-extra-emphasis :load-path "site-lisp/system/org/org-extra-emphasis"
  :after org)

;;; org-fc
(use-package org-fc :load-path "site-lisp/system/org/org-fc"
  :after org-id)
(use-package org-fc-hydra :load-path "site-lisp/system/org/org-fc-hydra"
  :after org-id)

;;; org-protocol-capture-html
(use-package org-protocol-capture-html :load-path "site-lisp/system/org/org-protocol-capture-html"
  :after org-protocol)

;;; jwiegley
(use-package jobhours :load-path "site-lisp/system/org/jwiegley/hours")

(provide 'system/org)
