;;; use-ess --- initialize ess
;;; Commentary:
;;; Code:
(require 'use-package)

(use-package ess
  :ensure t
  :bind (:map ess-mode-map
              ("C-n" . ess-eval-line-and-step))
  :config
  (setq comint-scroll-to-buttom-on-output t)
  (setq comint-scroll-to-buttom-on-input t)
  (setq comint-move-point-for-output t)
  :mode ("\\.R\\'" . R-mode))

(provide 'use-ess)
