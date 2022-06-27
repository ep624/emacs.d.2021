

(use-package flycheck-languagetool
  :ensure t
  :hook (text-mode . flycheck-languagetool-setup)
  :init
  (setq flycheck-languagetool-server-jar "/home/vikas/LanguageTool-5.0/languagetool-server.jar"))


(provide 'use-misc-language)
