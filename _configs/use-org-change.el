;;; use-org-change.el --- Org-change configuration -*- lexical-binding: t; -*-
;;; Commentary:
;;; This file configures the faces for the org-change package.

;;; Code:

(use-package org-change
  :ensure t
  :config
  (progn
    ;; Display the deleted/replaced text.
    (setq org-change-show-deleted t)
    ;; Face for the new/changed text.
    (set-face-attribute 'org-change-link-face nil :foreground "OliveDrab" :background "#3d444a")
    ;; Face for the old/deleted text.
    (set-face-attribute 'org-change-deleted-face nil :foreground "IndianRed" :strike-through t)))

(provide 'use-org-change)

;;; use-org-change.el ends here
