;;; use-ebib --- initialize ebib -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

(use-package ebib
  :ensure t)

(global-set-key (kbd "C-c e") 'ebib)

(use-package ebib-biblio
  :after (ebib biblio)
  :bind (:map biblio-selection-mode-map
              ("e" . ebib-biblio-selection-import)))

(provide 'use-ebib)

;;; use-ebib.el ends here
