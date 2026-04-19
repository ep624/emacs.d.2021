;;; use-ag.el --- Initialize ag (Silver Searcher) -*- lexical-binding: t; -*-
;;; Commentary:
;; ag is kept for dired-based search which affe/ripgrep don't cover.
;; For general text search prefer: affe-grep (M-s a g) or consult-ripgrep (M-s r)
;;; Code:

(use-package hydra :ensure t)

(use-package ag
  :ensure t
  :after hydra
  :config
  (setq ag-group-matches nil)

  (defhydra ag-hydra (:hint nil)
    "
[_g_] Search string    [_r_] Search regex
[_d_] Dired string     [_f_] Dired regex
[_k_] Kill ag buffers  [Powered by Ag / The Silver Searcher]"
    ("g" ag)
    ("r" ag-regexp)
    ("d" ag-dired)
    ("f" ag-dired-regexp)
    ("k" ag-kill-buffers))

  :bind ("M-`" . ag-hydra/body))

(provide 'use-ag)
;;; use-ag.el ends here
