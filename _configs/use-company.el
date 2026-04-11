;;; use-company --- use company mode -*- lexical-binding: t; -*-

(use-package company

  :init
  (global-company-mode)

  (dolist (backend
           '( ;; list of backends to set up
             ;; company-ispell
             ;; company-elisp
             company-wordfreq
             company-org-block
             ))
    (add-to-list 'company-backends
                 backend))

  (setq company-idle-delay 0
        company-echo-delay 0.1
        company-minimum-prefix-length 1
        company-show-numbers t
        company-selection-wrap-around t
        company-tooltip-align-annotations t))


(company-tng-configure-default)
(add-hook 'after-init-hook 'company-tng-mode)

(provide 'use-company)

;;; use-company.el ends here
