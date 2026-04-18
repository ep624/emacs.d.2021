;;; use-aider.el --- Initialize aidermacs -*- lexical-binding: t; -*-
;;; Commentary:
;; aidermacs provides an Emacs interface to aider (AI pair programming tool).
;; Requires aider to be installed: pip install aider-chat
;;
;; API key is retrieved from pass at startup: pass insert api/deepseek
;;; Code:

(use-package aidermacs
  :ensure t
  :init
  ;; Ensure aider binary is found — installed via pip to ~/.local/bin
  (add-to-list 'exec-path (expand-file-name "~/.local/bin"))
  ;; Retrieve DeepSeek API key from pass and set it as an environment variable
  ;; so the aider process can find it
  (setenv "DEEPSEEK_API_KEY"
          (string-trim (shell-command-to-string "pass api/deepseek")))
  :custom
  (aidermacs-use-architect-mode t)
  (aidermacs-default-model "deepseek")
  :bind
  ("C-c A" . aidermacs-transient-menu))

;; ob-aider: run aider sessions from org-babel src blocks
(use-package ob-aider
  :load-path "~/.emacs.d/ob-aider/ob-aider"
  :after org
  :config
  (org-babel-do-load-languages
   'org-babel-load-languages
   (append org-babel-load-languages
           '((aider . t)))))

(provide 'use-aider)
;;; use-aider.el ends here
