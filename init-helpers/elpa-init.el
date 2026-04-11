;;; elpa-init.el --- Initialize packages and quelpa -*- lexical-binding: t; -*-
;;; Commentary:
;; Archives are configured in early-init.el before package.el starts.
;; This file handles initialization, use-package, and quelpa bootstrap.
;;; Code:

(message "Emacs %s - init packages" emacs-version)

(require 'package)
(package-initialize)

;; Refresh archive index if empty (e.g. first run or after archive changes)
(when (seq-empty-p package-archive-contents)
  (package-refresh-contents))

;; Ensure use-package is available (built-in on Emacs 29+)
(unless (package-installed-p 'use-package)
  (package-install 'use-package))
(require 'use-package)

;; Bootstrap quelpa if not installed.
;; On first run this fetches quelpa.el from GitHub and self-upgrades.
(unless (package-installed-p 'quelpa)
  (with-temp-buffer
    (url-insert-file-contents "https://raw.githubusercontent.com/quelpa/quelpa/master/quelpa.el")
    (eval-buffer)
    (quelpa-self-upgrade)))

(quelpa
 '(quelpa-use-package
   :fetcher git
   :url "https://github.com/quelpa/quelpa-use-package.git"))

(require 'quelpa-use-package)

(provide 'elpa-init)
;;; elpa-init.el ends here
