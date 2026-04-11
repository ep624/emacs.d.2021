;;; use-nameless --- initialize nameless -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

(use-package nameless
  :ensure t

  :init
  (add-hook 'emacs-lisp-mode-hook 'nameless-mode)

  :config
  (setq nameless-prefix "⎆"))

(provide 'use-nameless)
;;; use-nameless ends here
