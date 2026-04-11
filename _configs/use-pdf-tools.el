;;; use-pdf-tools.el --- Initialize pdf-tools -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:
;; (pdf-tools-install)
(use-package pdf-tools
  :ensure t
  :mode ("\\.pdf\\'" . pdf-view-mode)
  :config
  ;; This is the line that was failing.
  ;; Putting it in :config ensures it runs ONLY after the package is loaded.
  (pdf-loader-install))

(provide 'use-pdf-tools)

;;; use-pdf-tools.el ends here
