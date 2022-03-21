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
  (:map org-mode-map :package org ("C-c ]" . #'org-cite-insert)))


(advice-add #'completing-read-multiple :override #'consult-completing-read-multiple)
(setq citar-at-point-function 'embark-act)

(setq citar-templates
      '((main . "${author editor:20}     ${date year issued:4}     ${title:30}")
        (suffix . "          ${=key= id:15}    ${=type=:12}")
        (preview . "${author editor} (${year issued date}) ${title}, ${journal journaltitle publisher container-title collection-title}.\n")
        (note . "Notes on ${author editor}, ${title}")))

;; (use-package all-the-icons
;;   :if (display-graphic-p)
;;   :init
;;   (setq citar-symbols
;;       `((file ,(all-the-icons-faicon "file-o" :face 'all-the-icons-green :v-adjust -0.1) . " ")
;;         (note ,(all-the-icons-material "speaker_notes" :face 'all-the-icons-blue :v-adjust -0.3) . " ")
;;         (link ,(all-the-icons-octicon "link" :face 'all-the-icons-orange :v-adjust 0.01) . " ")))
;;   (setq citar-symbol-separator "  ")
;;   )
