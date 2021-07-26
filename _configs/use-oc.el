
;;(add-to-list 'load-path "~/scimax/bibtex-actions")

;;(mybibs '("~/ssercloud/bibliobase/bibliobase.bib"))

(use-package ivy-bibtex
  :ensure t
  :init
  (setq bibtex-completion-bibliography '("~/ssercloud/bibliobase/bibliobase.bib")
        bibtex-completion-notes-path "~/ssercloud/bibliobase/notes/"
        bibtex-completion-notes-template-multiple-files "#+TITLE: Notes on: ${author-or-editor} (${year}): ${title}\n\nSee [cite/t:@${=key=}]\n"
        bibtex-completion-library-path '("~/ssercloud/pdfbibliobase/")
        bibtex-completion-additional-search-fields '(keywords)
        bibtex-completion-display-formats
        '((article       . "${=has-pdf=:1}${=has-note=:1} ${author:36} ${year:4} ${title:*} ${journal:40}")
          (inbook        . "${=has-pdf=:1}${=has-note=:1} ${author:36} ${year:4} ${title:*} Chapter ${chapter:32}")
          (book          . "${=has-pdf=:1}${=has-note=:1} ${author:36} ${year:4} ${title:*}")
          (incollection  . "${=has-pdf=:1}${=has-note=:1} ${author:36} ${year:4} ${title:*} ${booktitle:40}")
          (inproceedings . "${=has-pdf=:1}${=has-note=:1} ${author:36} ${year:4} ${title:*} ${booktitle:40}")
          (t             . "${=has-pdf=:1}${=has-note=:1} ${author:36} ${year:4} ${title:*}")))
  (setq bibtex-completion-pdf-open-function
        (lambda (fpath)
          (call-process "evince" nil 0 nil fpath)))
  )


(use-package pretty-hydra :ensure t)

(use-package citeproc :ensure t)

(use-package org-cite
  :load-path "~/.emacs.d/org-mode/lisp"
  :config
  (require 'oc-bibtex "~/scimax/org-ref3/oc-bibtex.el")
  (require 'oc-biblatex)
  (require 'oc-csl)
  (require 'doi-utils) ;; this is in org-ref still
  (setq
;;   org-cite-global-bibliography bibtex-completion-bibliography
   org-cite-csl-styles-dir "~/temp/styles"
   org-cite-insert-processor 'bibtex
   org-cite-follow-processor 'bibtex
   org-cite-activate-processor 'bibtex
   org-cite-export-processors '((html basic)
                                (latex biblatex)
                                (t (basic numeric))))

  (define-key org-mode-map (kbd "C-c \\") 'org-cite-insert))


;; bibretrieve

(use-package bibretrieve
  :after reftex
  :ensure t
  :config
  (setq bibretrieve-backends '(("citebase" . 10) ("mrl" . 10) ("arxiv" . 5) ("zbm" . 5)))
  (defun bibretrieve-scholar-create-url (author title)
    (let ((tempfile (make-temp-file "scholar" nil ".bib")))
      (call-process-shell-command "~/bin/gscholar/gscholar/gscholar.py --all" nil nil nil
                                  (if (> (length author) 0) (concat "\"" author "\""))
                                  (if (> (length title) 0)  (concat "\"" title "\""))
                                  (concat " > " tempfile))
      (concat "file://" tempfile)
      ))

  (defun bibretrieve-scholar ()
    (interactive)
    (setq mm-url-use-external t)
    (setq bibretrieve-backends '(("scholar" . 5)))
    (bibretrieve)
    (setq mm-url-use-external nil)
    )

  (defun bibretrieve-amazon-create-url (author title)
    (concat "http://lead.to/amazon/en/?key="(mm-url-form-encode-xwfu title) "&si=ble&op=bt&bn=&so=sa&ht=us"))
  (defun bibretrieve-amazon ()
    (interactive)
    (setq mm-url-use-external t)
    (setq mm-url-program "w3m")
    (setq mm-url-arguments (list "-dump"))
    (setq bibretrieve-backends '(("amazon" . 5)))
    (bibretrieve)
    (setq mm-url-use-external nil)
    )
  )


(provide 'use-oc)
