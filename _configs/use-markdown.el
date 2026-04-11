;;; use-markdown --- initialize markdown -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

(use-package markdown-mode
  :ensure t
  :commands (markdown-mode gfm-mode)
  :mode (("README\\.md\\'" . gfm-mode)
         ("\\.md\\'"       . markdown-mode)
         ("\\.markdown\\'" . markdown-mode))
  :init
  (setq markdown-command "markdown")
  :config
  ;; Commented out to fix "Symbol’s function definition is void: pm-hbtchunkmode"
  ;; (require 'jekyll-modes)

  ;; Batch unbind keys to clean up the config
  (dolist (key '("C-<up>" "C-<down>" "M-<up>" "M-<down>"
                 "M-<left>" "M-<right>" "M-S-<left>" "M-S-<right>"
                 "<S-iso-lefttab>" "S-<tab>" "<backtab>"))
    (unbind-key key markdown-mode-map))

  ;; Custom bindings
  (bind-keys :map markdown-mode-map
             ("<tab>"     . markdown-demote)
             ("<backtab>" . markdown-promote)
             ("C-c b"     . markdown-insert-bold)
             ("C-c i"     . markdown-insert-italic)
             ("C-c l"     . markdown-insert-link)
             ("C-c c"     . markdown-insert-code)))

(provide 'use-markdown)
;;; use-markdown ends here
