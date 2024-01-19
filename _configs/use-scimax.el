;;; use-scimax --- initialize scimax libraries
;;; Commentary:
;;; Code:

(add-to-list 'load-path "~/scimax/")
(add-to-list 'load-path "~/scimax/org-show")

(require 'org-show)
;; (use-package org-show
;;   :ensure t :after org
;;   :load-path (lambda () (expand-file-name "org-show" "~/scimax")))
(global-set-key '[f5] 'org-show-previous-slide)
(global-set-key '[f6] 'org-show-execute-slide)
(global-set-key '[f7] 'org-show-next-slide)

(provide 'use-scimax)
