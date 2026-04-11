;;; use-khalel.el --- Initialize khalel -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

(use-package khalel
  :ensure t
  :commands (khalel-export-org-subtree-to-calendar
             khalel-import-upcoming-events
             khalel-edit-calender-event
             khalel-add-capture-template)
  :config
  (setq khalel-khal-command "/home/vikas/.local/bin/khal")
  (setq khalel-capture-key "e")
  (setq khalel-import-org-file-confirm-overwrite nil)
  (setq khalel-import-time-delta "30d")
  (khalel-add-capture-template))

(provide 'use-khalel)
;;; use-khalel.el ends here
