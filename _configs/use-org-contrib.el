;;; use-org-contrib --- initialize org-contrib
;;; Commentary:
;;; Code:
(add-to-list 'load-path "~/.emacs.d/org-contrib/lisp")
(require 'ox-latex)
(require 'ox-beamer)
(require 'ox-odt)
(require 'ox-html)
(require 'ox-publish)
(require 'org-tempo)
(require 'org-id)
(require 'org-table)
(require 'ox-md)
(require 'ox-org)
;; (require 'ox-extra)
;; (ox-extras-activate '(ignore-headlines))

(use-package org-change :ensure t :after org)
(use-package org-sticky-header :ensure t :after org)

(setq org-latex-to-mathml-convert-command
      "latexmlmath \"%i\" --presentationmathml=%o")

(setq org-latex-caption-above '(image table special-block))
(setq org-latex-create-formula-image-program 'imagemagick)

(setenv "PATH" (concat (getenv "PATH") ":/usr/local/texlive/2023/bin/x86_64-linux/"))
(setq exec-path (append exec-path '("/usr/local/texlive/2023/bin/x86_64-linux/")))

'(org-preview-latex-default-process 'dvipng)
'(org-preview-latex-process-alist
  '((dvipng :programs ("latex" "dvipng") :description "dvi > png"
            :message
            "you need to install the programs: latex and dvipng."
            :image-input-type "dvi" :image-output-type "png"
            :image-size-adjust (1.0 . 1.0) :latex-compiler
            ("/usr/local/texlive/2023/bin/x86_64-linux/latex -interaction nonstopmode -output-directory %o %f")
            :image-converter ("dvipng -D %D -T tight -o %O %f")
            :transparent-image-converter
            ("dvipng -D %D -T tight -bg Transparent -o %O %f"))
    (dvisvgm :programs ("latex" "dvisvgm") :description "dvi > svg"
             :message
             "you need to install the programs: latex and dvisvgm."
             :image-input-type "dvi" :image-output-type "svg"
             :image-size-adjust (1.7 . 1.5) :latex-compiler
             ("/usr/local/texlive/2023/bin/x86_64-linux/latex -interaction nonstopmode -output-directory %o %f")
             :image-converter
             ("dvisvgm %f --no-fonts --exact-bbox --scale=%S --output=%O"))
    (imagemagick :programs ("latex" "convert") :description
                 "pdf > png" :message
                 "you need to install the programs: latex and imagemagick."
                 :image-input-type "pdf" :image-output-type "png"
                 :image-size-adjust (1.0 . 1.0) :latex-compiler
                 ("/usr/local/texlive/2023/bin/x86_64-linux/pdflatex -interaction nonstopmode -output-directory %o %f")
                 :image-converter
                 ("convert -density %D -trim -antialias %f -quality 100 %O"))))

(setq org-latex-pdf-process
      '("xelatex -interaction nonstopmode -output-directory %o %f"
        "biber %b"
        "xelatex -interaction nonstopmode -output-directory %o %f"
        "xelatex -interaction nonstopmode -output-directory %o %f"))

(setq org-format-latex-options (plist-put org-format-latex-options :scale 3.0))

;; Org latex classes

(add-to-list 'org-latex-classes
             '("vmemoir"
               "\\documentclass[11pt]{memoir}"
               ("\\chapter{%s}" . "\\chapter*{%s}")
               ("\\section{%s}" . "\\section*{%s}")
               ("\\subsection{%s}" . "\\subsection*{%s}")
               ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
               ("\\paragraph{%s}" . "\\paragraph*{%s}")))

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
             '("vmemoirbook"
               "\\documentclass[11pt]{memoir}"
               ("\\part{%s}" . "\\part*{%s}")
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
  (replace-regexp-in-string "\\(<tid>\\([[:blank:]]+\\&\\)+\\)[[:blank:]]\\\\\\\\.*" "\\\\toprule" row))


;; earlier version
;; (defun org-export-midrule-filter-latex (row backend info)
;;   (replace-regexp-in-string "\\(<mid>\\([[:blank:]]+\\&\\)+\\)[[:blank:]]\\\\\\\\" "\\\\midrule" row))


(defun org-export-midrule-filter-latex (row backend info)
  (replace-regexp-in-string "\\(<mid>\\([[:blank:]]+\\&\\)+\\)[[:blank:]]\\\\\\\\.*" "\\\\midrule" row))

(defun org-export-bottomrule-filter-latex (row backend info)
  (replace-regexp-in-string "\\(<bid>\\([[:blank:]]+\\&\\)+\\)[[:blank:]]\\\\\\\\.*" "\\\\bottomrule" row))

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

(defun my/org-latex--org-table (table contents info)
  "Return appropriate LaTeX code for an Org table.

TABLE is the table type element to transcode.  CONTENTS is its
contents, as a string.  INFO is a plist used as a communication
channel.

This function assumes TABLE has `org' as its `:type' property and
`table' as its `:mode' attribute."
  (let* ((attr (org-export-read-attribute :attr_latex table))
         (alignment (org-latex--align-string table info))
         (opt (org-export-read-attribute :attr_latex table :options))
         (table-env (or (plist-get attr :environment)
                        (plist-get info :latex-default-table-environment)))
         (width
          (let ((w (plist-get attr :width)))
            (cond ((not w) "")
                  ((member table-env '("tabular" "longtable")) "")
                  ((member table-env '("tabu" "longtabu"))
                   (format (if (plist-get attr :spread) " spread %s "
                             " to %s ")
                           w))
                  (t (format "{%s}" w)))))
         (caption (org-latex--caption/label-string table info))
         (above? (org-latex--caption-above-p table info)))
    (cond
     ((member table-env '("longtable" "longtabu"))
      (let ((fontsize (let ((font (plist-get attr :font)))
                        (and font (concat font "\n")))))
        (concat (and fontsize (concat "{" fontsize))
                (format "\\begin{%s}%s{%s}\n" table-env width alignment)
                (and above?
                     (org-string-nw-p caption)
                     (concat caption "\\\\\n"))
                contents
                (and (not above?)
                     (org-string-nw-p caption)
                     (concat caption "\\\\\n"))
                (format "\\end{%s}" table-env)
                (and fontsize "}"))))
     (t
      (let ((output (format "\\begin{%s}%s%s{%s}\n%s\\end{%s}"
                            table-env
                            (if opt opt "")
                            width
                            alignment
                            contents
                            table-env)))
        (org-latex--decorate-table output attr caption above? info))))))

(advice-add 'org-latex--org-table :override #'my/org-latex--org-table)

(defun org-word-count (beg end
                           &optional count-latex-macro-args?
                           count-footnotes?)
  "Report the number of words in the Org mode buffer or selected region.
Ignores:
- comments
- tables
- source code blocks (#+BEGIN_SRC ... #+END_SRC, and inline blocks)
- hyperlinks (but does count words in hyperlink descriptions)
- tags, priorities, and TODO keywords in headers
- sections tagged as 'not for export'.

The text of footnote definitions is ignored, unless the optional argument
COUNT-FOOTNOTES? is non-nil.

If the optional argument COUNT-LATEX-MACRO-ARGS? is non-nil, the word count
includes LaTeX macro arguments (the material between {curly braces}).
Otherwise, and by default, every LaTeX macro counts as 1 word regardless
of its arguments."
  (interactive "r")
  (unless mark-active
    (setf beg (point-min)
          end (point-max)))
  (let ((wc 0)
        (latex-macro-regexp "\\\\[A-Za-z]+\\(\\[[^]]*\\]\\|\\){\\([^}]*\\)}"))
    (save-excursion
      (goto-char beg)
      (while (< (point) end)
        (cond
         ;; Ignore comments.
         ((or (org-in-commented-line) (org-at-table-p))
          nil)
         ;; Ignore hyperlinks. But if link has a description, count
         ;; the words within the description.
         ((looking-at org-bracket-link-analytic-regexp)
          (when (match-string-no-properties 5)
            (let ((desc (match-string-no-properties 5)))
              (save-match-data
                (incf wc (length (remove "" (org-split-string
                                             desc "\\W")))))))
          (goto-char (match-end 0)))
         ((looking-at org-any-link-re)
          (goto-char (match-end 0)))
         ;; Ignore source code blocks.
         ((org-in-regexps-block-p "^#\\+BEGIN_SRC\\W" "^#\\+END_SRC\\W")
          nil)
         ;; Ignore inline source blocks, counting them as 1 word.
         ((save-excursion
            (backward-char)
            (looking-at org-babel-inline-src-block-regexp))
          (goto-char (match-end 0))
          (setf wc (+ 2 wc)))
         ;; Count latex macros as 1 word, ignoring their arguments.
         ((save-excursion
            (backward-char)
            (looking-at latex-macro-regexp))
          (goto-char (if count-latex-macro-args?
                         (match-beginning 2)
                       (match-end 0)))
          (setf wc (+ 2 wc)))
         ;; Ignore footnotes.
         ((and (not count-footnotes?)
               (or (org-footnote-at-definition-p)
                   (org-footnote-at-reference-p)))
          nil)
         (t
          (let ((contexts (org-context)))
            (cond
             ;; Ignore tags and TODO keywords, etc.
             ((or (assoc :todo-keyword contexts)
                  (assoc :priority contexts)
                  (assoc :keyword contexts)
                  (assoc :checkbox contexts))
              nil)
             ;; Ignore sections marked with tags that are
             ;; excluded from export.
             ((assoc :tags contexts)
              (if (intersection (org-get-tags-at) org-export-exclude-tags
                                :test 'equal)
                  (org-forward-same-level 1)
                nil))
             (t
              (incf wc))))))
        (re-search-forward "\\w+\\W*")))
    (message (format "%d words in %s." wc
                     (if mark-active "region" "buffer")))))



(use-package stripe-buffer
  :ensure t
  :after org
  :config
  (add-hook 'org-mode-hook 'turn-on-stripe-table-mode)
  )




(provide 'use-org-contrib)
