;;; use-org-contrib --- initialize org-contrib
;;; Commentary:
;;; Code:
(add-to-list 'load-path "~/.emacs.d/org-contrib/lisp")
(require 'ox-latex)
(setq org-latex-caption-above '(image table special-block))
(setq org-latex-create-formula-image-program 'imagemagick)
;; Org latex classes

(add-to-list 'org-latex-classes
             '("vmemoir"
               "\\documentclass[11pt]{memoir}"
               ("\\chapter{%s}" . "\\chapter*{%s}")
               ("\\section{%s}" . "\\section*{%s}")
               ("\\subsection{%s}" . "\\subsection*{%s}")
               ("\\subsubsection{%s}" . "\\subsubsection*{%s}")))

(add-to-list 'org-latex-classes
             '("vreport"
               "\\documentclass[11pt]{report}"
               ("\\chapter{%s}" . "\\chapter*{%s}")
               ("\\section{%s}" . "\\section*{%s}")
               ("\\subsection{%s}" . "\\subsection*{%s}")
               ("\\subsubsection{%s}" . "\\subsubsection*{%s}")))

(add-to-list 'org-latex-classes
             '("varticle"
               "\\documentclass[11pt,article,twoside,openany,strict,extrafontsizes]{memoir}"
               ("\\section{%s}" . "\\section*{%s}")
               ("\\subsection{%s}" . "\\subsection*{%s}")
               ("\\subsubsection{%s}" . "\\subsubsection*{%s}")))

(add-to-list 'org-latex-classes
             '("vposter"
               "\\documentclass[28pt,portrait, margin=0mm, innermargin=15mm, blockverticalspace=15mm, colspace=15mm, subcolspace=8mm]{tikzposter}"
               ("\\section{%s}" . "\\section*{%s}")
               ("\\subsection{%s}" . "\\subsection*{%s}")
               ("\\subsubsection{%s}" . "\\subsubsection*{%s}")))
(require 'ox-beamer)
(require 'ox-odt)
(require 'ox-html)
(require 'ox-publish)
(require 'ox-extra)
;; (use-package ox-extra :after org)
(require 'org-tempo)
(use-package org-sticky-header :ensure t :after org)

(ox-extras-activate '(ignore-headlines))
;; optional but very useful libraries in org-ref
(global-set-key [f10] 'org-ref-open-bibtex-notes)
(global-set-key [f11] 'org-ref-open-bibtex-pdf)
(global-set-key [f12] 'org-ref-open-in-browser)

;; (use-package org-ql
;;   :quelpa (org-ql :fetcher github :repo "alphapapa/org-ql"))

;; (use-package org-sidebar
;;  :quelpa (org-sidebar :fetcher github :repo "alphapapa/org-sidebar"))

(use-package org-ref
  :quelpa (org-ref :fetcher github :repo "jkitchin/org-ref")
  :bind (("<f10>" . org-ref-bibtex-notes)
         ("<f11>" . org-ref-open-bibtex-pdf)
         ("<f12>" . org-ref-open-in-browser))
  :config
  (setq org-ref-default-citation-link "citep")
  (setq org-ref-insert-cite-key "C-c )")
  )
(require 'doi-utils)
(require 'org-id)
(require 'org-table)
(require 'ox-md)

(provide 'use-org-contrib)
