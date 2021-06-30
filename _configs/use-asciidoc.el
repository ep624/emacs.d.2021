;;; use-asciidoc --- use asciidoc
;;; Commentary:
;;; Code:
(require 'use-package)

(use-package asciidoc
  :ensure t
  :defer t
  :init (add-to-list 'auto-mode-alist '("\\.asciidoc$" . asciidoc-mode)))

(provide 'use-asciidoc)
;;; use-asciidoc ends here
