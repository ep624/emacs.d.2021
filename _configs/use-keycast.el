;;; use-keycast.el --- Initialize keycast -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

(use-package keycast
  :ensure t
  :config
  ;; Works with doom-modeline:
  ;; https://github.com/tarsius/keycast/issues/7#issuecomment-627604064
  (define-minor-mode keycast-mode
    "Show current command and its key binding in the mode line."
    :global t
    (if keycast-mode
        (add-hook 'pre-command-hook 'keycast--update t)
      (remove-hook 'pre-command-hook 'keycast--update)))
  (add-to-list 'global-mode-string '("" mode-line-keycast " "))
  (keycast-mode))

(provide 'use-keycast)
;;; use-keycast.el ends here
