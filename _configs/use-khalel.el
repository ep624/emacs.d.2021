;; use-khalel

(use-package khalel
  :commands (khalel-export-org-subtree-to-calendar
             khalel-import-upcoming-events
             khalel-edit-calender-event
             khalel-add-capture-template
             ))

(setq khalel-khal-command "/home/vikas/.local/bin/khal")
;;(setq khalel-vdirsyncer-command "vdirsyncer")

(setq khalel-capture-key "e")
(setq khalel-import-org-file-confirm-overwrite nil)
(setq khalel-import-time-delta "30d")
(khalel-add-capture-template)

(provide 'use-khalel)
