;;; use-vertico-affe.el --- Initialize affe fuzzy finder -*- lexical-binding: t; -*-
;;; Commentary:
;; Affe provides asynchronous fuzzy file and text search using fd and ripgrep.
;; Requires: fd (fd-find) and ripgrep (rg) to be installed.
;;   Ubuntu:  apt install fd-find ripgrep
;;   macOS:   brew install fd ripgrep
;;
;; Key bindings:
;;   M-s a   affe-find   — fuzzy find files (uses fd), async
;;   M-s A   affe-grep   — fuzzy grep text  (uses ripgrep), async
;;
;; Complements consult:
;;   M-s f   consult-fd        — structured file find with preview
;;   M-s r   consult-ripgrep   — structured grep with preview
;;   C-s     consult-line      — current buffer search
;;; Code:

(use-package affe
  :ensure t
  :after orderless
  :config
  ;; Use fd for file finding — faster than find, respects .gitignore
  (when (executable-find "fd")
    (setq affe-find-command "fd --color=never --full-path"))

  ;; Use ripgrep for text search
  (when (executable-find "rg")
    (setq affe-grep-command "rg --color=never --line-number -v ^$ ."))

  ;; Use orderless for fuzzy matching (consistent with vertico/consult)
  (consult-customize affe-grep :initial nil)
  (setq affe-regexp-function #'orderless-pattern-compiler
        affe-highlight-function #'orderless--highlight)

  :bind (("M-s a" . affe-find)
         ("M-s A" . affe-grep)))

(provide 'use-vertico-affe)
;;; use-vertico-affe.el ends here
