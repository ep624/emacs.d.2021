(use-package citar
  :ensure t
  :no-require
  :custom
  (org-cite-global-bibliography '("~/bibliobase/bibliobase.bib"))
  (org-cite-insert-processor 'citar)
  (org-cite-follow-processor 'citar)
  (org-cite-activate-processor 'citar)
  (citar-bibliography org-cite-global-bibliography)
  ;; optional: org-cite-insert is also bound to C-c C-x C-@
  :bind
  (:map org-mode-map :package org ("C-c ]" . #'org-cite-insert))
  :hook
  (LaTeX-mode . citar-capf-setup)
  (org-mode . citar-capf-setup)
  )


; (advice-add #'completing-read-multiple :override #'consult-completing-read-multiple)
; (setq citar-at-point-function 'embark-act)

(use-package citar-embark
  :after citar embark
  :no-require
  :config (citar-embark-mode))

;; install all-the-icons and run m-x all-the-icons-install-fonts for the following to work.

;; (use-package all-the-icons
;;   :if (display-graphic-p)
;;   :init
;;   (setq citar-symbols
;;       `((file ,(all-the-icons-faicon "file-o" :face 'all-the-icons-green :v-adjust -0.1) . " ")
;;         (note ,(all-the-icons-material "speaker_notes" :face 'all-the-icons-blue :v-adjust -0.3) . " ")
;;         (link ,(all-the-icons-octicon "link" :face 'all-the-icons-orange :v-adjust 0.01) . " ")))
;;   (setq citar-symbol-separator "  ")
;;   )

;; (use-package citar-capf
;;   :after citar
;;   :demand t
;;   :config
;;   (setq citar-templates
;;       '((prefix . "${:p} ${:n}")
;;         (main . "${author editor:20}     ${date year issued:4}     ${title:30}")
;;         (suffix . "          ${=key= id:15}    ${=type=:12}")
;;         (preview . "${author editor} (${year issued date}) ${title}, ${journal journaltitle publisher container-title collection-title}.\n")
;;         (note . "Notes on ${author editor}, ${title}")))
;;   ;; Standard Emacs completion-at-point support. NOTE: `citar-capf` takes priority
;;   ;; in hook functions but will move to the next function in the hook if no
;;   ;; matches are available.
;;   (defun citar-capf-hook () (add-hook 'completion-at-point-functions #'citar-capf -100 t))
;;   ;; Add hooks
;;   (add-hook 'tex-mode-hook #'citar-capf-hook)
;;   (add-hook 'markdown-mode-hook #'citar-capf-hook)
;;   (add-hook 'org-mode-hook #'citar-capf-hook)
;;   ;; Global hook
;;   (add-hook 'completion-at-point-functions #'citar-capf 'append))

(provide 'use-citar)
