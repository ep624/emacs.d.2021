;;; use-ispell.el --- Initialize ispell -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

(use-package ispell
  :config
  (when (file-exists-p "/usr/bin/aspell")
    (set-variable 'ispell-program-name "/usr/bin/aspell"))
  (setq ispell-dictionary "en_GB")
  (add-hook 'text-mode-hook #'turn-on-flyspell)
  (add-hook 'prog-mode-hook #'flyspell-prog-mode))

(provide 'use-ispell)
;;; use-ispell.el ends here
