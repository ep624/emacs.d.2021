;;; use-eshell --- initialize eshell -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

(use-package eshell-git-prompt
  :ensure t
  :config
  (eshell-git-prompt-use-theme 'powerline))

(provide 'use-eshell)
;;; use-eshell ends here
