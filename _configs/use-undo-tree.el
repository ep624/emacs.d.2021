;;; use-undo-tree.el --- Initialize undo-tree -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

(use-package undo-tree
  :ensure t
  :config (setq undo-tree-visualizer-timestamps t)
  :bind ("C-c C-u" . undo-tree-visualize))

(provide 'use-undo-tree)
;;; use-undo-tree.el ends here
