;;; use-ess.el --- Initialize ESS (Emacs Speaks Statistics) -*- lexical-binding: t; -*-
;;; Commentary:
;; ESS supports R, S, SAS, Stata and Julia.
;; R language server (languageserver package) provides LSP support via eglot.
;; Install in R: install.packages("languageserver")
;;; Code:

(use-package ess
  :ensure t
  :defer t
  :init
  (require 'ess-site)
  :config
  (ess-set-style 'OWN)

  ;; Indentation settings
  (setq ess-indent-level 2
        ess-indent-offset 2
        ess-fancy-comments nil
        ess-indent-with-fancy-comments nil
        ess-nuke-trailing-whitespace-p t
        ess-offset-arguments-newline '(prev-line 2))

  ;; Comint scrolling behaviour
  (setq comint-scroll-to-bottom-on-output t
        comint-scroll-to-bottom-on-input t
        comint-move-point-for-output t)

  ;; Create the R treesit parser via find-file-hook, which fires after all
  ;; major-mode hooks and after treesit-fold-mode has activated. We then
  ;; re-enable treesit-fold-mode so it picks up the now-existing parser.
  (defun vikas/ess-r-ensure-treesit-parser ()
    "Ensure R treesit parser exists and restart treesit-fold-mode if needed."
    (when (and (eq major-mode 'ess-r-mode)
               (treesit-language-available-p 'r))
      (unless (treesit-parser-list)
        (treesit-parser-create 'r)
        ;; Restart treesit-fold-mode so it sees the parser
        (when (bound-and-true-p treesit-fold-mode)
          (treesit-fold-mode -1)
          (treesit-fold-mode 1)))))

  (add-hook 'find-file-hook #'vikas/ess-r-ensure-treesit-parser)

  ;; History
  ;; (setq ess-history-directory "~/.R/")
  ;; (setq ess-history-file "~/.R/history")

  :bind (:map ess-mode-map
              ("C-n" . ess-eval-line-and-step)
              ("C-c C-j" . ess-eval-line)
              ("<C-S-return>" . ess-eval-region-or-function-or-paragraph-and-step))
  :hook
  ;; Use eglot for LSP (requires R package: install.packages("languageserver"))
  (ess-r-mode . eglot-ensure))

;; Fix treesit-fold R node names: the installed grammar uses 'braced_expression'
;; but treesit-fold's built-in entry was written against an older grammar that
;; used 'brace_list'. Replace the entry entirely with correct node names.
(with-eval-after-load 'treesit-fold
  (setf (alist-get 'ess-r-mode treesit-fold-range-alist)
        '((braced_expression  . treesit-fold-range-seq)
          (if_statement       . treesit-fold-range-seq)
          (for_statement      . treesit-fold-range-seq)
          (while_statement    . treesit-fold-range-seq)
          (repeat_statement   . treesit-fold-range-seq)
          (function_definition . treesit-fold-range-seq))))

(use-package reformatter
  :ensure t
  :config
  ; This creates a function 'r-styler-format-buffer' and a minor mode
  (reformatter-define r-styler
    :program "R"
    :args '("--slave" "--no-save" "--no-restore" "-e" "styler::style_text(readLines(file('stdin')))")))



(reformatter-define r-styler
  :program "Rscript"
  :args (list "-e" "suppressMessages(suppressWarnings(styler::style_text(readLines(file('stdin')))))")
  :stdin t
  :stdout t)


(provide 'use-ess)
;;; use-ess.el ends here
