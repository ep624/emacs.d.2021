;;; use-anzu.el --- Anzu mode, pretty isearch and query replace -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

(use-package anzu
  :ensure t
  :config (global-anzu-mode t)
  :bind (("M-%"   . anzu-query-replace)
         ("s-%"   . anzu-query-replace-at-cursor)
         ("M-C-%" . anzu-query-replace-regexp)))

(provide 'use-anzu)
;;; use-anzu.el ends here
