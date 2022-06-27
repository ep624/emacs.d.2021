(require 'quelpa-use-package)
(use-package plz
  :quelpa (plz :fetcher github :repo "alphapapa/plz.el"))

;; Install Ement.
(use-package ement
  :quelpa (ement :fetcher github :repo "alphapapa/ement.el"))

(provide 'use-ement)
