;;; use-flycheck.el --- Initialize flycheck -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

(use-package flycheck :ensure t)

(add-hook 'prog-mode-hook #'flycheck-mode)

(add-hook 'css-mode-hook #'flycheck-mode)

(provide 'use-flycheck)

;;; use-flycheck.el ends here
