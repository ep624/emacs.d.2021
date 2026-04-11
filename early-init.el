;;; early-init.el --- Early initialization -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

;; Prevent package.el from initializing before we configure archives.
;; package-initialize is called explicitly in elpa-init.el instead.
(setq package-enable-at-startup nil)

;; Prevent Emacs from saving package-archives to custom.el
(put 'package-archives 'customized-value nil)

(setq package-archives
      '(("melpa"        . "https://melpa.org/packages/")
        ("melpa-stable" . "https://stable.melpa.org/packages/")
        ("gnu"          . "https://elpa.gnu.org/packages/")
        ("nongnu"       . "https://elpa.nongnu.org/nongnu/")))



(provide 'early-init)
;;; early-init.el ends here
