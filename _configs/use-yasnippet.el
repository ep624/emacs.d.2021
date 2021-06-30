
;; use-yasnippet

(use-package yasnippet :ensure t)

(yas-global-mode t)

(setq yas-prompt-functions '(yas-ido-prompt
                             yas-dropdown-prompt
                             yas/x-prompt
                             yas/completing-prompt
                             yas/no-prompt))


(use-package yasnippet-snippets
  :ensure t
  :after yasnippet)

(provide 'use-yasnippet)
