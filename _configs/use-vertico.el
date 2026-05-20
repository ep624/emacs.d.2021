;;; use-vertico.el --- Initialize vertico completion UI -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

(use-package vertico
  :ensure t
  :init
  (vertico-mode)
  :bind (:map vertico-map
              ("C-j"   . vertico-next)
              ("C-k"   . vertico-previous)
              ("C-f"   . vertico-exit)
              ;; vertico-quick: press C-' then the shown key to jump to candidate
              ("C-'"   . vertico-quick-jump)
              ("C-\""  . vertico-quick-exit)
              :map minibuffer-local-map
              ("M-h"   . backward-kill-word))
  :custom
  (vertico-cycle t)
  (vertico-reverse-mode 1)
  (vertico-multiform-mode 1))

;; --- vertico-quick: jump to any candidate with one keystroke ---
;; Press C-' and a highlighted key label appears next to each candidate.
;; Press that key to jump directly to it. Much faster than scrolling.
(use-package vertico-quick
  :ensure nil  ; part of vertico
  :after vertico
  :config
  ;; Keys used for quick labels — two rows gives enough candidates
  (setq vertico-quick1 "asdfghjkl"
        vertico-quick2 "qwertyuiop"))

;; --- vertico-multiform: per-command and per-category display styles ---
(use-package vertico-multiform
  :ensure nil  ; part of vertico
  :after vertico
  :config
  ;; Per-command overrides
  (setq vertico-multiform-commands
        '(;; Buffer search: flat list suits line-by-line results
          (consult-line           reverse)
          (consult-ripgrep        reverse)
          (consult-grep           reverse)
          (affe-grep              reverse)
          ;; File finding: flat works well for path display
          (affe-find              reverse)
          (consult-fd             reverse)
          ;; Navigation: reverse so closest match is near prompt
          (consult-imenu          reverse)
          (consult-outline        reverse)
          (consult-global-mark    reverse)
          ;; M-x: grid layout lets you scan commands quickly
          (execute-extended-command (reverse grid))
          ;; Buffer switching: posframe popup feels more natural
          (consult-buffer         (reverse posframe))))

  ;; Per-category overrides
  (setq vertico-multiform-categories
        '((file    reverse)
          (buffer  reverse)
          (symbol  reverse)
          (command (reverse grid)))))

;; --- vertico-posframe: floating popup for buffer switching ---
(use-package vertico-posframe
  :ensure t
  :after vertico
  :config
  (setq vertico-posframe-poshandler #'posframe-poshandler-frame-center
        vertico-posframe-width      120
        vertico-posframe-height     20
        vertico-posframe-border-width 2
        vertico-posframe-parameters '((left-fringe  . 8)
                                      (right-fringe . 8))))

;; --- orderless: fuzzy matching style ---
(use-package orderless
  :ensure t
  :demand t
  :config

  (defun +orderless--consult-suffix ()
    "Regexp which matches the end of string with Consult tofu support."
    (if (and (boundp 'consult--tofu-char) (boundp 'consult--tofu-range))
        (format "[%c-%c]*$"
                consult--tofu-char
                (+ consult--tofu-char consult--tofu-range -1))
      "$"))

  (defun +orderless-consult-dispatch (word _index _total)
    (cond
     ((string-suffix-p "$" word)
      `(orderless-regexp . ,(concat (substring word 0 -1) (+orderless--consult-suffix))))
     ((and (or minibuffer-completing-file-name
               (derived-mode-p 'eshell-mode))
           (string-match-p "\\`\\..+" word))
      `(orderless-regexp . ,(concat "\\." (substring word 1) (+orderless--consult-suffix))))))

  (orderless-define-completion-style +orderless-with-initialism
    (orderless-matching-styles '(orderless-initialism orderless-literal orderless-regexp)))

  (setq completion-styles '(orderless basic)
        completion-category-defaults nil
        completion-category-overrides '((file (styles partial-completion))
                                        (command (styles +orderless-with-initialism))
                                        (variable (styles +orderless-with-initialism))
                                        (symbol (styles +orderless-with-initialism)))
        orderless-component-separator #'orderless-escapable-split-on-space
        orderless-style-dispatchers (list #'+orderless-consult-dispatch
                                          #'orderless-affix-dispatch)))

;; Persist history over Emacs restarts
(use-package savehist
  :init (savehist-mode))

(use-package emacs
  :init
  (defun crm-indicator (args)
    (cons (concat "[CRM] " (car args)) (cdr args)))
  (advice-add #'completing-read-multiple :filter-args #'crm-indicator)
  (setq minibuffer-prompt-properties
        '(read-only t cursor-intangible t face minibuffer-prompt))
  (add-hook 'minibuffer-setup-hook #'cursor-intangible-mode)
  (setq enable-recursive-minibuffers t))

(define-key vertico-map "?"           #'minibuffer-completion-help)
(define-key vertico-map (kbd "M-RET") #'minibuffer-force-complete-and-exit)
(define-key vertico-map (kbd "M-TAB") #'minibuffer-complete)

;;(setq completion-styles '(substring orderless))
;; (setq read-file-name-completion-ignore-case t
;;       read-buffer-completion-ignore-case t
;;       completion-ignore-case t)

;; --- marginalia: annotations in the minibuffer ---
(use-package marginalia
  :ensure t
  :after vertico
  :bind (("M-A" . marginalia-cycle)
         :map minibuffer-local-map
         ("M-A" . marginalia-cycle))
  :custom
  (marginalia-annotators '(marginalia-annotators-heavy marginalia-annotators-light nil))
  :init (marginalia-mode))

;; --- embark: actions on minibuffer candidates ---
(use-package embark
  :ensure t
  :bind (("M-."   . embark-act)
         ("M-m"   . embark-dwim)
         ("C-h B" . embark-bindings))
  :init
  (setq prefix-help-command #'embark-prefix-help-command)
  :config
  (add-to-list 'display-buffer-alist
               '("\\`\\*Embark Collect \\(Live\\|Completions\\)\\*"
                 nil
                 (window-parameters (mode-line-format . none)))))

(use-package embark-consult
  :ensure t
  :after (embark consult)
  :demand t
  :hook (embark-collect-mode . consult-preview-at-point-mode))

;; --- all-the-icons-completion: icons in marginalia annotations ---
(use-package all-the-icons-completion
  :ensure t
  :after (marginalia all-the-icons)
  :hook (marginalia-mode . all-the-icons-completion-marginalia-setup)
  :init (all-the-icons-completion-mode))

(provide 'use-vertico)
;;; use-vertico.el ends here
