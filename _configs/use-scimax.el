;;; use-scimax --- initialize scimax libraries
;;; Commentary:
;;; Code:

(use-package org-show
  :ensure nil
  :load-path (lambda () (expand-file-name "org-show" "~/scimax")))
(global-set-key '[f5] 'org-show-previous-slide)
(global-set-key '[f6] 'org-show-execute-slide)
(global-set-key '[f7] 'org-show-next-slide)

(use-package ox-word
  :ensure nil
  :load-path "~/scimax")

(provide 'use-scimax)
