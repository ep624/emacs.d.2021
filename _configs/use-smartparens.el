;;; use-smartparens --- Unified editing and colors -*- lexical-binding: t; -*-

;; --- 1. Smartparens Configuration ---
(require 'cua-base)
(define-key cua-global-keymap [C-return] nil)

(use-package smartparens
  :ensure t
  :config
  (smartparens-global-mode t)

  ;; Global pairs with wrap shortcuts
  (sp-pair "(" ")"   :wrap "C-c (")
  (sp-pair "[" "]"   :wrap "C-c [")
  (sp-pair "{" "}"   :wrap "C-c {")
  (sp-pair "\"" "\"" :wrap "C-c \"")
  (sp-pair "'" "'"   :wrap "C-c '")
  (sp-pair "`" "`"   :wrap "C-c `")

  ;; Major mode specific pairs
  (sp-local-pair 'markdown-mode "<kbd>" "</kbd>" :wrap "C-c k")
  (sp-local-pair 'ruby-mode "|" "|" :wrap "C-c |")

  ;; Lisp specific logic
  (sp-with-modes sp--lisp-modes
    (sp-local-pair "'" nil :actions nil)
    (sp-local-pair "`" "'" :when '(sp-in-string-p sp-in-comment-p)))

  ;; Keybindings for structural navigation
  (bind-keys
   ("C-x r <left>"    . sp-forward-slurp-sexp)
   ("C-x r <right>"   . sp-forward-barf-sexp)
   ("C-x r <S-left>"  . sp-backward-slurp-sexp)
   ("C-x r <S-right>" . sp-backward-barf-sexp)
   ("C-x r r"         . sp-rewrap-sexp)
   ("C-x r s"         . sp-split-sexp)
   ("C-x r j"         . sp-join-sexp)))

;; --- 2. Rainbow Delimiters (Prog & CSS) ---
(use-package rainbow-delimiters
  :ensure t
  :hook ((prog-mode . rainbow-delimiters-mode)   ; Integrated from use-rainbow-delimiters.el
         (css-mode . rainbow-delimiters-mode)))

;; --- 3. Rainbow Mode (Color Highlighting) ---
(use-package rainbow-mode
  :ensure t
  :hook (css-mode . rainbow-mode)) ; Integrated from use-rainbow.el

(provide 'use-smartparens)
;;; use-smartparens.el ends here
