;;; use-ess --- initialize ess
;;; Commentary:
;;; Code:
(require 'use-package)

(use-package langtool
  :ensure t
  :config
  (setq langtool-java-classpath
      "/usr/share/languagetool:/usr/share/java/languagetool/*")
  (setq langtool-default-language "en-GB")
  (setq langtool-mother-tongue "en")
  ;; :mode ("\\.org\\'" . org)
  )

(provide 'use-langtool)
