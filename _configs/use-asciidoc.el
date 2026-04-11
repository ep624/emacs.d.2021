;;; use-asciidoc --- use asciidoc -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

(use-package asciidoc
  :ensure t
  :defer t
  :init (add-to-list 'auto-mode-alist '("\\.asciidoc$" . asciidoc-mode)))

(provide 'use-asciidoc)
;;; use-asciidoc ends here
