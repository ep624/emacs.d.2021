
(add-to-list 'load-path "~/scimax/bibtex-actions")

;;(mybibs '("~/ssercloud/bibliobase/bibliobase.bib"))

(use-package ivy-bibtex :ensure t)

(use-package oc-bibtex
  :ensure t
  :)



;;(use-package embark :ensure t)

;; (require 'oc)

;;(use-package bibtex-actions :ensure t)

(use-package bibtex-actions :ensure t
  :load-path
  :after (embark oc org)
  :config
  ;; Make the 'bibtex-actions' bindings and targets available to `embark'.
  (add-to-list 'embark-target-finders 'bibtex-actions-citation-key-at-point)
  (add-to-list 'embark-keymap-alist '(bibtex . bibtex-actions-map))
  (add-to-list 'embark-keymap-alist '(citation . bibtex-actions-map-buffer))
  ;; Make sure to set this to ensure 'bibtex-actions-open-link' command works correctly.
  (bibtex-completion-additional-search-fields '(doi url))
  (bibtex-completion-bibliography '("~/ssercloud/bibliobase/bibliobase.bib")))

;; use consult-completing-read for enhanced interface
(advice-add #'completing-read-multiple :override #'consult-completing-read-multiple)

(use-package bibtex-actions-org-cite
  :bind (("C-c b" . org-cite-insert)
         ("M-o" . org-open-at-point)
         :map minibuffer-local-map
         ("M-b" . bibtex-actions-insert-preset))
  :after (embark org oc bibtex-actions)
;;  :config
  ;; make sure to set this to ensure open commands work correctly
  ;;(bibtex-completion-additional-search-fields '(doi url))
;;  (bibtex-completion-bibliography "~/ssercloud/bibliobase/bibliobase.bib")
  ;;(org-cite-global-bibliography "~/ssercloud/bibliobase/bibliobase.bib")
  )

;; Use consult-completing-read for enhanced interface.
(advice-add #'completing-read-multiple :override #'consult-completing-read-multiple)

;; If you use which-key, want to move the Embark actions behind a submenu, and sort
;; based on the description.
(setq embark-general-map `(keymap (?G . ,embark-general-map)))
(define-key bibtex-actions-org-cite-map "G" '("general actions >" . (embark-general-map)))
(setq which-key-sort-order 'which-key-description-order)

;; (setq bibtex-actions-at-point-function 'embark-act)
