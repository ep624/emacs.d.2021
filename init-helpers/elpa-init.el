(when (>= emacs-major-version 24)
  (message "Emacs %s - init packages" emacs-version)

  ;; elpa/package.el
  (require 'package)

  (setq package-archives
        '(("melpa"        . "https://melpa.org/packages/")
          ("melpa-stable" . "https://stable.melpa.org/packages/")
          ("org"          . "https://orgmode.org/elpa/")
          ("gnu"          . "https://elpa.gnu.org/packages/")))

  (package-initialize)) ;; init elpa packages

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
