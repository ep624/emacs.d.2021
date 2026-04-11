;;; use-web-mode.el --- Initialize web-mode -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

(use-package web-mode
  :ensure t
  :mode ("\\.mustache\\'"
         "\\.rxml\\'"
         "\\.rhtml\\'"
         "\\.erb\\'"
         "\\.rjs\\'"))

(provide 'use-web-mode)
;;; use-web-mode.el ends here
