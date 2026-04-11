;;; use-ement.el --- Initialize ement Matrix client -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

(require 'quelpa-use-package)

(use-package plz
  :quelpa (plz :fetcher github :repo "alphapapa/plz.el"))

(use-package ement
  :quelpa (ement :fetcher github :repo "alphapapa/ement.el"))

(provide 'use-ement)
;;; use-ement.el ends here
