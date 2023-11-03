

(use-package flycheck
  :ensure t)

(use-package flycheck-languagetool
  :ensure t
  :hook (text-mode . flycheck-languagetool-setup)
  :init
  (setq flycheck-languagetool-server-jar "/usr/share/java/languagetool/languagetool-server.jar"))

(setq langtool-java-classpath
      "/usr/share/languagetool:/usr/share/java/languagetool/*")
;;(setq langtool-language-tool-jar "/usr/share/java/languagetool/languagetool-server.jar")
(setq langtool-default-language "en-GB")
(require 'langtool)

(flycheck-define-checker proselint
  "A linter for prose."
  :command ("proselint" source-inplace)
  :error-patterns
  ((warning line-start (file-name) ":" line ":" column ": "
        (id (one-or-more (not (any " "))))
        (message) line-end))
  :modes (text-mode markdown-mode gfm-mode org-mode))

(provide 'use-misc-language)
