;;; use-misc-settings.el --- Miscellaneous settings -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:
(setq custom-enabled-themes '(doom-iosvkem))


(show-paren-mode 1)
(xterm-mouse-mode 1)
(recentf-mode 1)
(setq recentf-max-menu-items 25)
(setq recentf-max-saved-items 200)
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

;; Make *Warnings* appear as a small side-window at the bottom that doesn't
;; steal focus or interfere with window layout. C-x o skips it, splits won't
;; happen next to it, and it auto-dismisses after 5 seconds.
(add-to-list 'display-buffer-alist
             '("\\*Warnings\\*"
               (display-buffer-in-side-window)
               (side . bottom)
               (slot . 0)
               (window-height . 0.15)
               (no-other-window . t)
               (preserve-size . (nil . t))))

(defun my/auto-bury-warnings ()
  "Bury the *Warnings* buffer after a short delay."
  (run-with-timer 5 nil
                  (lambda ()
                    (when-let* ((win (get-buffer-window "*Warnings*")))
                      (delete-window win)))))

(add-hook 'warning-series-started-hook #'my/auto-bury-warnings)

(set-face-attribute 'default nil :family "Cascadia Code" :height 150)

;; Show a subtle vertical line at the recommended column width.
;; Uses the fill-column value (default 80, set per-mode below).
(setq-default display-fill-column-indicator-column 120)
(add-hook 'prog-mode-hook #'display-fill-column-indicator-mode)
(add-hook 'text-mode-hook #'display-fill-column-indicator-mode)

;; Per-mode column widths — override fill-column locally
(add-hook 'ess-r-mode-hook  (lambda () (setq fill-column 120)))
(add-hook 'python-ts-mode-hook (lambda () (setq fill-column 120)))
(add-hook 'emacs-lisp-mode-hook (lambda () (setq fill-column 100)))

(set-face-attribute 'fill-column-indicator nil
                    :foreground "gray30"
                    :weight 'light)

(provide 'use-misc-settings)

;;; use-misc-settings.el ends here
