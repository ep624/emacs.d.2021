;;; use-org-ref --- initialize org-ref -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:


(use-package org-ref)

(setq org-ref-insert-cite-function
      (lambda ()
        (org-cite-insert nil)))

(define-key org-mode-map (kbd "C-c ]") 'org-ref-insert-link)

(require 'quelpa-use-package)

(use-package persid
  :quelpa (persid :fetcher github :repo "rougier/persid"))

;; (quelpa '(org-capture-ref :repo "yantar92/org-capture-ref" :fetcher github))
;; (quelpa '(asoc :repo "troyp/asoc.el" :fetcher github))
;; (quelpa 's)
;; (quelpa 'doct)

(use-package org-capture-ref
  :ensure t
  :after org
  :quelpa (org-capture-ref :fetcher github :repo "yantar92/org-capture-ref"))

(defun jmax-title-case-article (&optional key start end)
  "Convert a bibtex entry article title to title-case.
The arguments are optional, and are only there so you can use this
function with `bibtex-map-entries' to change all the title
entries in articles."
  (interactive)
  (bibtex-beginning-of-entry)

  (let* ((title (bibtex-autokey-get-field "title"))
         (words (split-string title))
         (lower-case-words '("a" "an" "on" "and" "for"
                             "the" "of" "in")))
    (when
        (string= "article" (downcase (cdr (assoc "=type=" (bibtex-parse-entry)))))
      (setq words (mapcar
                   (lambda (word)
                     (if (or
                          ;; match words containing {} or \ which are probably
                          ;; LaTeX or protected words
                          (string-match "\\$\\|{\\|}\\|\\\\" word)
                          ;; these words should not be capitalized, unless they
                          ;; are the first word
                          (-contains? lower-case-words (s-downcase word)))
                         word
                       (s-capitalize word)))
                   words))

      ;; Check if first word should be capitalized
      (when (-contains? jmax-lower-case-words (car words))
        (setf (car words) (s-capitalize (car words))))

      ;; this is defined in doi-utils
      (bibtex-set-field
       "title"
       (mapconcat 'identity words " "))
      (bibtex-fill-entry))))


(provide 'use-org-ref)

;;; use-org-ref.el ends here
