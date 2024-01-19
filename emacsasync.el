(require 'package)
(setq package-enable-at-startup nil)
(package-initialize)
(add-to-list 'load-path "~/.emacs.d/org-mode/lisp")

(require 'org)
(require 'ox)
(require 'cl)
(setq org-export-async-debug nil)

(add-to-list 'load-path "~/.emacs.d/org-contrib/lisp")
(require 'ox-latex)
(require 'ox-beamer)
(require 'ox-odt)
(require 'ox-html)
;; (require 'ox-extra)
;; (ox-extras-activate '(latex-header-blocks ignore-headlines))
(require 'ox-publish)
(require 'org-tempo)
;; (require 'doi-utils)
(require 'org-id)
(require 'org-table)
(require 'ox-md)
(require 'ox-org)
(require 'ob-async)

(use-package org-sticky-header :ensure t :after org)

(org-babel-do-load-languages
 (quote org-babel-load-languages)
 (quote ((emacs-lisp . t)
         (R . t)
         (org . t)
         (ditaa . t)
         (latex . t)
         (dot . t)
         (ditaa . t)
         (python . t)
         (gnuplot . t)
         (screen . nil)
         (shell . t)
         (sql . t)
         (latex . t)
         (sqlite . t))))



(setq org-latex-caption-above '(image table special-block))
(setq org-latex-create-formula-image-program 'imagemagick)

(setenv "PATH" (concat (getenv "PATH") ":/usr/local/texlive/2023/bin/x86_64-linux/"))
(setq exec-path (append exec-path '("/usr/local/texlive/2023/bin/x86_64-linux/")))

;; (setq org-latex-pdf-process
;;       '("/usr/local/texlive/2023/bin/x86_64-linux/latexmk -pvc -interaction=nonstopmode -output-directory=data/ -pdf %f"))
;;        "/usr/local/texlive/2023/bin/x86_64-linux/latexmk -pvc -interaction=nonstopmode -output-directory=data/ -c %f"))

 (setq org-latex-pdf-process
       '("/usr/local/texlive/2023/bin/x86_64-linux/xelatex -interaction nonstopmode -output-directory %o %f"))
;;         "/usr/local/texlive/2023/bin/x86_64-linux/biber %b"
;;         "/usr/local/texlive/2023/bin/x86_64-linux/xelatex -interaction nonstopmode -output-directory %o %f"
;;         "/usr/local/texlive/2023/bin/x86_64-linux/xelatex -interaction nonstopmode -output-directory %o %f"))

;; Org latex classes

(add-to-list 'org-latex-classes
             '("vmemoir"
               "\\documentclass[11pt]{memoir}"
               ("\\chapter{%s}" . "\\chapter*{%s}")
               ("\\section{%s}" . "\\section*{%s}")
               ("\\subsection{%s}" . "\\subsection*{%s}")
<<<<<<< HEAD
               ("\\subsubsection{%s}" . "\\subsubsection*{%s}")))
=======
               ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
               ("\\paragraph{%s}" . "\\paragraph*{%s}")))
>>>>>>> vikas

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

(add-to-list 'org-latex-classes
             '("beamer"
               "\\documentclass[presentation]{beamer}"
               ("\\section{%s}" . "\\section*{%s}")
               ("\\subsection{%s}" . "\\subsection*{%s}")
               ("\\subsubsection{%s}" . "\\subsubsection*{%s}")))

(add-to-list 'org-beamer-environments-extra
             '("onlyenv" "O" "\\begin{onlyenv}%a" "\\end{onlyenv}"))
(add-to-list 'org-beamer-environments-extra
             '("textpos" "X" "\\begin{textblock}{10}(3,3) \\visible %a {" "} \\end{textblock}"))
(add-to-list 'org-beamer-environments-extra
             '("textpos1" "w" "\\begin{textblock}{%h}(3,3) \\visible %a {" "} \\end{textblock}"))



;; some other useful functions

(defun org-export-multicolumn-filter (row backend info)
  (cond
   ((org-export-derived-backend-p backend 'latex)
    (org-export-multicolumn-filter-latex row backend info))
   ((org-export-derived-backend-p backend 'latex)
    (org-export-multicolumn-filter-latex0 row backend info))
   ((org-export-derived-backend-p backend 'html)
    (org-export-multicolumn-filter-html row backend info))))



;; original from Eric
(defun org-export-multicolumn-filter-latex (row backend info)
  (while (string-match
          "\\(<\\([0-9]+\\)col\\([lrc]\\)?>[[:blank:]]*\\([^&]+\\)\\)" row)
    (let ((columns (string-to-number (match-string 2 row)))
          (start (match-end 0))
          (contents (replace-regexp-in-string
                     "\\\\" "\\\\\\\\"
                     (replace-regexp-in-string "[[:blank:]]*$" ""
                                               (match-string 4 row))))
          (algn (or (match-string 3 row) "l")))
      (setq row (replace-match
                 (format "\\\\multicolumn{%d}{%s}{%s}" columns algn contents)
                 nil nil row 1))
      (while (and (> columns 1) (string-match "&" row start))
        (setq row (replace-match "" nil nil row))
        (decf columns))
      ))
  row)

;; midrules

(defun org-export-tabularray-cmidrule-filter-latex (row backend info)
  (while (string-match
          "\\(<\\([0-9]+\\)cd\\([0-9]+\\)?>[[:blank:]]*\\([^&]+\\)\\)" row)
    (let ((start (string-to-number (match-string 2 row)))
          (end (or (match-string 3 row) "l")))
      (setq row (replace-match
                 (format "\\\\cmidrule{%s-%s}" start end)
                 nil nil row 1))
      (while (string-match "& \\| \\\\\\\\" row 0)
        (setq row (replace-match "" nil nil row))
        (decf start))
      )
    )
  row)


(defun org-export-cmidrule-filter-latex (row backend info)
  (while (string-match
          "\\(<\\([0-9]+\\)cid\\([0-9]+\\)?>[[:blank:]]*\\([^&]+\\)\\)" row)
    (let ((start (string-to-number (match-string 2 row)))
          (end (or (match-string 3 row) "l")))
      (setq row (replace-match
                 (format "\\\\cmidrule(lr){%s-%s}" start end)
                 nil nil row 1))
      (while (string-match "& \\| \\\\\\\\" row 0)
        (setq row (replace-match "" nil nil row))
        (decf start))
      )
    )
  row)

(defun org-export-toprule-filter-latex (row backend info)
  (replace-regexp-in-string "\\(<tid>\\([[:blank:]]+\\&\\)+\\)[[:blank:]]\\\\\\\\" "\\\\toprule" row))

(defun org-export-midrule-filter-latex (row backend info)
  (replace-regexp-in-string "\\(<mid>\\([[:blank:]]+\\&\\)+\\)[[:blank:]]\\\\\\\\" "\\\\midrule" row))

(defun org-export-bottomrule-filter-latex (row backend info)
  (replace-regexp-in-string "\\(<bid>\\([[:blank:]]+\\&\\)+\\)[[:blank:]]\\\\\\\\" "\\\\bottomrule" row))

(defun org-export-multicolumn-filter-html (row backend info)
  (while (string-match "class=\".*\" *>&lt;\\([0-9]+\\)col\\([lrc]\\)?&gt;" row)
    (let ((columns (string-to-number (match-string 1 row)))
          (start (match-end 0))
          (algn (case (intern (or (match-string 2 row) "l"))
                  (c "center")
                  (r "right")
                  (l "left"))))
      (setq row (replace-match
                 (format " class=\"%s\" colspan=\"%s\">" algn columns)
                 nil nil row))
      (while (and (> columns 1)
                  (string-match "<th .*>&#xa0;</th>" row start))
        (setq row (replace-match "" nil nil row))
        (decf columns))))
  row)



;; modified

(defun org-export-multicolumn-filter-latex0 (row backend info)
  (while (string-match
          "\\(<\\([0-9]+\\)clm\\([lrc]\\)?>[[:blank:]]*\\([^&]+\\)\\)" row)
    (let ((columns (string-to-number (match-string 2 row)))
          (start (match-end 0))
          (contents (replace-regexp-in-string
                     "\\\\" "\\\\\\\\"
                     (replace-regexp-in-string "[[:blank:]]*$" ""
                                               (match-string 4 row))))
          (algn (or (match-string 3 row) "l")))
      (setq row (replace-match
                 (format "\\\\mcx{%d}{%s}" columns contents)
                 nil nil row 1))
      (while (and (> columns 1) (string-match "&" row start))
        (setq row (replace-match "" nil nil row))
        (decf columns))))
  row)



(defun org-export-multicolumn-filter-html (row backend info)
  (while (string-match "class=\".*\" *>&lt;\\([0-9]+\\)col\\([lrc]\\)?&gt;" row)
    (let ((columns (string-to-number (match-string 1 row)))
          (start (match-end 0))
          (algn (case (intern (or (match-string 2 row) "l"))
                  (c "center")
                  (r "right")
                  (l "left"))))
      (setq row (replace-match
                 (format " class=\"%s\" colspan=\"%s\">" algn columns)
                 nil nil row))
      (while (and (> columns 1)
                  (string-match "<th .*>&#xa0;</th>" row start))
        (setq row (replace-match "" nil nil row))
        (decf columns))))
  row)

(defun org-export-blanks-filter-latex (row backend info)
  "Replace nil in table with --- in LaTeX export."
  (when (org-export-derived-backend-p backend 'latex)
    (replace-regexp-in-string "nil" "\\\\mcone{---}" row)))

(defun org-export-blanks-filter-html (row backend info)
  "Replace nil in table with --- in HTML export."
  (when (org-export-derived-backend-p backend 'html)
    (replace-regexp-in-string "nil" "---" row)))


(add-to-list 'org-export-filter-table-row-functions
             'org-export-multicolumn-filter)

(add-to-list 'org-export-filter-table-row-functions
             'org-export-cmidrule-filter-latex)

(add-to-list 'org-export-filter-table-row-functions
             'org-export-tabularray-cmidrule-filter-latex)

(add-to-list 'org-export-filter-table-row-functions
             'org-export-toprule-filter-latex)

(add-to-list 'org-export-filter-table-row-functions
             'org-export-midrule-filter-latex)

(add-to-list 'org-export-filter-table-row-functions
             'org-export-bottomrule-filter-latex)

(add-to-list 'org-export-filter-table-row-functions
             'org-export-blanks-filter-latex)

(add-to-list 'org-export-filter-table-row-functions
             'org-export-blanks-filter-html)
