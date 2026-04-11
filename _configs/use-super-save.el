;;; use-super-save --- initialize super-save -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

(use-package super-save
  :init
  (super-save-mode t)
  :ensure t)

(defcustom super-save-triggers '(switch-to-buffer other-window)
  "A list of commands which would trigger `super-save-command'."
  :group 'super-save
  :type '(repeat string))

(provide 'use-super-save)
;;; use-super-save ends here
