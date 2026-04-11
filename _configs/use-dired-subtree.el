;;; -*- lexical-binding: t; -*-
(use-package dired-subtree :ensure t
  :after dired
  :config
  (bind-key "<tab>" #'dired-subtree-toggle dired-mode-map)
  (bind-key "<backtab>" #'dired-subtree-cycle dired-mode-map))

(provide 'use-dired-subtree)
;;; use-dired-subtree.el ends here
