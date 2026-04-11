;;; use-paren-completer.el --- Setup paren-completer -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

(use-package paren-completer
  :ensure t
  :bind (("s-]" . paren-completer-add-single-delimiter)
         ("s-}" . paren-completer-add-all-delimiters)))

(provide 'use-paren-completer)
;;; use-paren-completer.el ends here
