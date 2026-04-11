;;; use-xterm.el --- Initialize xterm-color -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

(use-package xterm-color :ensure t)

(progn
  (add-hook 'comint-preoutput-filter-functions 'xterm-color-filter)
  (setq comint-output-filter-functions
        (remove 'ansi-color-process-output comint-output-filter-functions))
  (setq font-lock-unfontify-region-function 'xterm-color-unfontify-region))

(provide 'use-xterm)
;;; use-xterm.el ends here
