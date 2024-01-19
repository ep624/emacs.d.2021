;;; use-bibtex-actions --- initialize bibtex-actions
;;; Commentary:
;;; Code:


(use-package oc
  :load-path "~/.emacs.d/org-mode/lisp/"
  :config
  (require 'oc-csl)
  (require 'oc-biblatex)
  )

(defvar my/bibs '("~/bibliobase/bibliobase.bib"))

(use-package bibtex-completion
  :ensure t
  )

(setq bibtex-completion-bibliography my/bibs)
(setq bibtex-completion-library-path '("~/vikascloud/pdfbibliobase"))

(use-package embark :ensure t)
(use-package bibtex-actions
  :load-path "~/.emacs.d/bibtex-actions/"
  :ensure t
  :after (embark org oc)
  :bind (("C-c b" . org-cite-insert)
         ("M-o" . org-open-at-point)
         :map minibuffer-local-map
         ("M-b" . bibtex-actions-insert-preset))
  )

;; (use-package bibtex-actions :ensure t
;;   :bind (("C-c b" . bibtex-actions-insert-citation)
;;          :map minibuffer-local-map
;;          ("M-b" . bibtex-actions-insert-preset))

;;   :after (embark oc org bibtex-completion)
;;   :config
;;   ;; Make the 'bibtex-actions' bindings and targets available to `embark'.
;;   (add-to-list 'embark-target-finders 'bibtex-actions-citation-key-at-point)
;;   (add-to-list 'embark-keymap-alist '(bibtex . bibtex-actions-map))
;;   (add-to-list 'embark-keymap-alist '(citation . bibtex-actions-map-buffer))
;; )

;;  :after (embark org oc bibtex-actions)
  ;; :config
  ;; (setq bibtex-actions-bibliography my/bibs
  ;;       org-cite-global-bibliography my/bibs

(require 'oc-bibtex-actions)

(setq org-cite-insert-processor 'oc-bibtex-actions
      org-cite-follow-processor 'oc-bibtex-actions
      org-cite-activate-processor 'oc-bibtex-actions)

;; Use consult-completing-read for enhanced interface.
;; (advice-add #'completing-read-multiple :override #'consult-completing-read-multiple)

;; ;; If you use which-key, want to move the Embark actions behind a submenu, and sort
;; ;; based on the description.
;; (setq bibtex-actions-at-point-function 'embark-act)
;; (setq embark-general-map `(keymap (?G . ,embark-general-map)))
;; ;(define-key bibtex-actions-org-cite-map "G" '("general actions >" . (embark-general-map)))
;; (setq which-key-sort-order 'which-key-description-order)

;; (setq bibtex-actions-symbols
;;   `((file . (,(all-the-icons-icon-for-file "foo.pdf" :face 'all-the-icons-dred) .
;;             ,(all-the-icons-icon-for-file "foo.pdf" :face 'bibtex-actions-icon-dim)))
;;     (note . (,(all-the-icons-icon-for-file "foo.txt") .
;;             ,(all-the-icons-icon-for-file "foo.txt" :face 'bibtex-actions-icon-dim)))
;;     (link .
;;         (,(all-the-icons-faicon "external-link-square" :v-adjust 0.02 :face 'all-the-icons-dpurple) .
;;         ,(all-the-icons-faicon "external-link-square" :v-adjust 0.02 :face 'bibtex-actions-icon-dim)))))
;; ;; Here we define a face to dim non 'active' icons, but preserve alignment
;; (defface bibtex-actions-icon-dim
;;     '((((background dark)) :foreground "#282c34")
;;      (((background light)) :foreground "#fafafa"))
;;      "Face for obscuring/dimming icons"
;;      :group 'all-the-icons-faces)

(provide 'use-bibtex-actions)
