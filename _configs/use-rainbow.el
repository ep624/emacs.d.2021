;; use-rainbow
;; Rainbow mode for css automatically

(use-package rainbow-mode :ensure t)
(add-hook 'css-mode-hook 'rainbow-mode)
(provide 'use-rainbow)
