;;; use-org-ref --- initialize org-ref
;;; Commentary:
;;; Code:


(use-package org-ref)

(setq org-ref-insert-cite-function
      (lambda ()
        (org-cite-insert nil)))

(define-key org-mode-map (kbd "C-c ]") 'org-ref-insert-link)

(require 'quelpa-use-package)



(quelpa '(org-capture-ref :repo "yantar92/org-capture-ref" :fetcher github))
(quelpa '(asoc :repo "troyp/asoc.el" :fetcher github))
(quelpa 's)
(quelpa 'doct)

(use-package org-capture-ref)

(provide 'use-org-ref)
