;;; -*- lexical-binding: t; -*-
(use-package persistent-scratch
  :ensure t
  :config
  (persistent-scratch-setup-default))
(persistent-scratch-autosave-mode 1)

(provide 'use-persistent-scratch)
;;; use-persistent-scratch.el ends here
