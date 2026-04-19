;;; use-projectile.el --- Initialize projectile -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

(use-package projectile
  :ensure t
  :config
  (projectile-global-mode t)

  ;; Use affe-find for fuzzy project file finding when available,
  ;; otherwise fall back to default projectile completion
  (setq projectile-completion-system 'default)

  (defun vikas/projectile-find-file ()
    "Find file in project using affe if available, else projectile default."
    (interactive)
    (if (fboundp 'affe-find)
        (affe-find (projectile-project-root))
      (projectile-find-file)))

  (defun projectile-open-last-known-project ()
    "Open the root folder of the last known project."
    (interactive)
    (find-file (car (projectile-load-known-projects))))

  :bind (("M-p"   . vikas/projectile-find-file)
         ("M-P"   . projectile-find-file)
         ("C-x p" . vikas/projectile-find-file)))

(provide 'use-projectile)
;;; use-projectile.el ends here
