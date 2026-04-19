;;; use-eca.el --- AI coding assistants: eca, minuet, gptel -*- lexical-binding: t; -*-
;;; Commentary:
;; This file configures three complementary AI tools:
;;
;;   eca     — Editor Code Assistant: chat-style AI via a sidebar
;;   minuet  — Inline auto-suggestions via Codestral (Mistral's FIM code model)
;;             API key retrieved from pass at runtime (pass insert api/codestral)
;;   gptel   — General-purpose LLM chat and completion (provides gptel-fn-complete)
;;
;; Minuet auto-suggestions are enabled only in prog-mode buffers and are
;; suppressed in sensitive directories (.emacs.d, .gnupg, .ssh).
;;
;; Keybindings summary:
;;   C-c . c   minuet-show-suggestion   (manual trigger)
;;   C-c . f   gptel-fn-complete
;;   C-c . .   xref-find-definitions
;;   C-c . ,   xref-go-back
;;   C-c . /   xref-find-references
;;   C-c . RET embark-act
;;   (same map also on C-c C-. / C-x . / C-x C-.)
;;
;; In an active minuet suggestion:
;;   C-c C-c   accept full suggestion
;;   <tab>     accept current line
;;   C-c C-n   next suggestion
;;   C-c C-p   previous suggestion
;;   C-g       dismiss
;;; Code:

;; ---------------------------------------------------------------------------
;; eca — Editor Code Assistant
;; ---------------------------------------------------------------------------
(use-package eca
  :ensure t
  :vc (:url "https://github.com/editor-code-assistant/eca-emacs" :rev :newest))

;; ---------------------------------------------------------------------------
;; gptel — general LLM chat/completion (needed for gptel-fn-complete in keymap)
;; ---------------------------------------------------------------------------
(use-package gptel
  :ensure t
  :defer t)

;; --- 1. Copilot Setup (The Primary Auto-Engine) ---
(use-package copilot
  :ensure t
  :quelpa (copilot :fetcher github :repo "copilot-emacs/copilot.el" :files ("dist" "*.el"))
  :hook (prog-mode . copilot-mode)
  :config
  ;; 1. Standardize TAB to only do Indent/LSP
  (define-key copilot-mode-map (kbd "<tab>") nil)
  (define-key copilot-mode-map (kbd "TAB") nil)

  ;; 2. Dedicated Copilot Keys
  ;; C-f to accept full block
  (define-key copilot-mode-map (kbd "C-f") #'copilot-accept-completion)
  ;; C-e to accept line by line
  (define-key copilot-mode-map (kbd "C-e") #'copilot-accept-completion-by-line)

  ;; 3. Navigation between multiple suggestions
  (define-key copilot-mode-map (kbd "M-n") #'copilot-next-completion)
  (define-key copilot-mode-map (kbd "M-p") #'copilot-previous-completion))

;; --- 2. Minuet Setup (Manual Codestral Engine) ---
(use-package minuet
  :ensure t
  :custom
  (minuet-provider 'codestral)
  (minuet-n-completions 1)
  (minuet-context-window 16384)
  ;; We disable auto-suggestion mode here
  (minuet-auto-suggestion-mode nil)
  :config
  ;; API key retrieval
  (plist-put minuet-codestral-options :api-key
             (lambda () (getenv "CODESTRAL_API_KEY")))

  ;; Minuet Overlay Keys (Active only when a suggestion is shown)
  :bind (:map minuet-active-mode-map
              ("C-c C-c" . minuet-accept-suggestion)
              ("C-c C-n" . minuet-next-suggestion)
              ("C-c C-p" . minuet-previous-suggestion)
              ("<tab>"   . minuet-accept-suggestion-line)))

;; --- 3. Unified AI & Navigation Map ---
(defvar my-ai-nav-map
  (let ((map (make-sparse-keymap)))
    ;; AI Suggestions
    (keymap-set map "c"   #'copilot-complete)       ; Manual Copilot refresh
    (keymap-set map "m"   #'minuet-show-suggestion)  ; Manual Minuet (Codestral) call
    (keymap-set map "f"   #'gptel-fn-complete)      ; gptel's completion
    ;; Navigation
    (keymap-set map "."   #'xref-find-definitions)
    (keymap-set map ","   #'xref-go-back)
    (keymap-set map "/"   #'xref-find-references)
    (keymap-set map "RET" #'embark-act)
    map)
  "Combined AI and xref navigation keymap.")

(keymap-global-set "C-c ." my-ai-nav-map)
(keymap-global-set "C-x ." my-ai-nav-map)

;; --- 4. Global Maintenance ---
(with-eval-after-load 'company
  (setq company-frontends (delq 'company-preview-if-just-one-frontend company-frontends)))

(setq flycheck-check-syntax-automatically '(save mode-enabled))
(setq lsp-signature-auto-activate nil)

(provide 'use-eca)
;;; use-eca.el ends here
