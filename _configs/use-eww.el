;;; use-eww.el --- Initialize eww -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

(use-package eww
  :config
  (bind-key "L" 'browse-web eww-mode-map))

(provide 'use-eww)
;;; use-eww.el ends here
