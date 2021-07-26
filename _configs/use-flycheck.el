;; use-flycheck
(require 'use-package)

(use-package flycheck :ensure t)

(add-hook 'prog-mode-hook #'flycheck-mode)

(add-hook 'css-mode-hook #'flycheck-mode)

(provide 'use-flycheck)
