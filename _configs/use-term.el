;;; use-term.el --- Initialize term -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

(use-package term
  :config
  (bind-key "C-x y" 'term-paste))

(provide 'use-term)
;;; use-term.el ends here
