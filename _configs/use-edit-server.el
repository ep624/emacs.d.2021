;;; use-edit-server -- browser textarea editing delegated to an emacs buffer -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

(use-package edit-server
  :ensure t
  :init
  (progn (edit-server-start)))

(provide 'use-edit-server)
;;; use-edit-server ends here
