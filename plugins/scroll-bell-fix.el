;;; scroll-bell-fix.el --- Suppress bell on scroll commands -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

(defun scroll-bell-function ()
  "Ring bell only for non-scroll commands."
  (unless (memq this-command
                '(isearch-abort abort-recursive-edit exit-minibuffer
                  keyboard-quit mwheel-scroll down up next-line previous-line
                  backward-char forward-char))
    (ding)))

(setq ring-bell-function 'scroll-bell-function)

(provide 'scroll-bell-fix)
;;; scroll-bell-fix.el ends here
