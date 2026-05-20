;;; use-remember-themes.el --- Initialize remember-themes -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:
;; (add-hook 'remember-theme-after-load-hook
;;           (lambda ()
;;             (amitp-mode-line)))


;; (remember-theme-load)
(add-hook 'kill-emacs-hook 'remember-theme-save)

(use-package remember-last-theme
  :ensure t
  :config
  ;; (remember-last-theme-enable))

(advice-add 'load-theme :before
            (lambda (&rest _) (mapc #'disable-theme custom-enabled-themes)))

(provide 'use-remember-themes)
;;; use-remember-themes.el ends here
