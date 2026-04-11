;;; use-ivy --- Ivy mode awesomesauce -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:

(use-package ivy
  :ensure t
  :config
  (setq ivy-wrap t) ;; turn on ivy selection wrapping
  ;; (setq ivy-re-builders-alist
  ;;     '((ivy-switch-buffer . ivy--regex-plus)
  ;;       (t . ivy--regex-fuzzy)))
  (setq ivy-initial-inputs-alist nil)
  )


;;(require 'ivy)

;;; use-ivy ends here
(provide 'use-ivy)

;;; use-ivy.el ends here
