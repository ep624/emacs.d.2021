;;; ob-rec.el --- org-babel functions for recutils evaluation

;; Copyright (C) 2011 Jose E. Marchesi

;; Author: Jose E. Marchesi
;; Keywords: literate programming
;; Homepage: http://www.gnu.org/software/recutils

;; This file is NOT part of GNU Emacs.

;; This program is free software: you can redistribute it and/or
;; modify it under the terms of the GNU General Public License as
;; published by the Free Software Foundation, either version 3 of the
;; License, or (at your option) any later version.

;; This program is distributed in the hope that it will be useful, but
;; WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
;; General Public License for more details.

;;; Commentary:

;; Org-Babel support for evaluating recsel queries and substituing the
;; contained template.

;;; Code:
(require 'ob)

(defvar org-babel-default-header-args:rec
  '((:results . "raw") (:exports . "results")))

(defun org-babel-execute:rec (body params)
  "Execute a block containing a recsel query.
This function is called by `org-babel-execute-src-block'."
  (let* ((in-file ((lambda (el)
		     (or el
			 (error
			  "rec code block requires :data header argument")))
		   (cdr (assoc :data params))))
	 (cmdline (cdr (assoc :cmdline params)))
	 (rec-type (cdr (assoc :type params)))
	 (fields (cdr (assoc :fields params)))
	 (cmd (concat "recsel"
		      (when rec-type (concat " -t " rec-type " "))
		      " " (expand-file-name in-file)
		      (when body (concat " -e " "\""
					 (replace-regexp-in-string "\"" "\\\\\"" body)
					 "\""))
		      (when fields (concat " -p " fields " "))
		      " | rec2csv")))
    (with-temp-buffer
      (shell-command cmd (current-buffer))
      (when (not (equal (point-min) (point-max)))
	(org-table-convert-region (point-min) (point-max) '(4)))
      (buffer-substring (point-min) (point-max)))))
    
(provide 'ob-rec)

;; ob-rec.el ends here
