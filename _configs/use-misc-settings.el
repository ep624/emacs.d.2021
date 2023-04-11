
;; use-misc-settings
(show-paren-mode 1)
(xterm-mouse-mode 1)
(recentf-mode 1)
(setq recentf-max-menu-items 25)
(setq recentf-max-saved-items 25)
(setq tramp-default-method "ssh")
(setq show-paren-delay 0.25)
(setq kill-whole-line 1)
(fset 'yes-or-no-p 'y-or-n-p)

(put 'set-goal-column           'disabled nil)
(put 'erase-buffer              'disabled nil)
(put 'downcase-region           'disabled nil)
(put 'upcase-region             'disabled nil)
(put 'narrow-to-region          'disabled nil)
(put 'narrow-to-page            'disabled nil)
(put 'dired-find-alternate-file 'disabled nil)
(put 'scroll-left               'disabled nil)

(global-display-line-numbers-mode)

(defun unfill-paragraph (&optional region)
  "Takes a multi-line paragraph and makes it into a single line of text."
  (interactive (progn (barf-if-buffer-read-only) '(t)))
  (let ((fill-column (point-max))
        ;; This would override `fill-column' if it's an integer.
        (emacs-lisp-docstring-fill-column t))
    (fill-paragraph nil region)))
(define-key global-map "\M-Q" 'unfill-paragraph)

(defun my-l-margin (&optional number)
  "Set margins to be used while screencasting"
  (interactive "p")
  (setq left-margin-width (or number 0))
  (set-window-buffer nil (current-buffer)))

(defun my-r-margin (&optional number)
  "Set margins to be used while screencasting"
  (interactive "p")
  (setq right-margin-width (or number 0))
  (set-window-buffer nil (current-buffer)))

(provide 'use-misc-settings)
