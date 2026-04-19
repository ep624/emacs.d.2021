;;; use-corfu.el --- Completion with corfu + cape -*- lexical-binding: t; -*-
;;; Commentary:
;; corfu provides the completion popup (replaces company).
;; cape provides extra completion-at-point sources (replaces company backends).
;;; Code:

(use-package corfu
  :ensure t
  :custom
  (corfu-cycle t)                ;; Cycle through candidates
  (corfu-auto t)                 ;; Auto-show popup
  (corfu-auto-delay 0.2)         ;; Slight delay before popup (was company-idle-delay 0)
  (corfu-auto-prefix 1)          ;; Start after 1 char (was company-minimum-prefix-length 1)
  (corfu-quit-at-boundary nil)   ;; Keep popup at word boundaries
  (corfu-quit-no-match nil)      ;; Keep popup even with no match
  (corfu-preview-current nil)    ;; Don't insert candidate until selected
  (corfu-preselect 'prompt)      ;; Don't pre-select first candidate
  (corfu-on-exact-match nil)     ;; Don't auto-insert on exact match
  (corfu-scroll-margin 5)
  :bind (:map corfu-map
              ("TAB"     . corfu-next)
              ([tab]     . corfu-next)
              ("S-TAB"   . corfu-previous)
              ([backtab] . corfu-previous)
              ("RET"     . corfu-insert)
              ("C-g"     . corfu-quit))
  :init
  (global-corfu-mode)
  ;; Save completion history so corfu can sort by frequency
  (corfu-history-mode 1))

;; Persist corfu history across sessions
(use-package savehist
  :ensure nil
  :config
  (add-to-list 'savehist-additional-variables 'corfu-history))

;; corfu in terminal (TUI) — corfu-terminal renders the popup in non-GUI frames
(use-package corfu-terminal
  :ensure t
  :unless (display-graphic-p)
  :after corfu
  :config
  (corfu-terminal-mode 1))

;; cape: Completion At Point Extensions (replaces company backends)
;; Provides: file, dabbrev, dict, keyword, tex, sgml, abbrev, ispell, etc.
(use-package cape
  :ensure t
  :init
  ;; Global capf list — order matters, first match wins
  (add-to-list 'completion-at-point-functions #'cape-dabbrev)   ;; across-buffer words (replaces company-dabbrev)
  (add-to-list 'completion-at-point-functions #'cape-file)      ;; file paths (replaces company-files)
  (add-to-list 'completion-at-point-functions #'cape-keyword)   ;; language keywords (replaces company-keywords)
  :config
  ;; In org-mode: add ispell and tex completions
  (add-hook 'org-mode-hook
            (lambda ()
              (add-to-list 'completion-at-point-functions #'cape-tex t)
              (add-to-list 'completion-at-point-functions #'cape-ispell t)))
  ;; In TeX/LaTeX mode: add tex and ispell completions
  (add-hook 'LaTeX-mode-hook
            (lambda ()
              (add-to-list 'completion-at-point-functions #'cape-tex t)
              (add-to-list 'completion-at-point-functions #'cape-ispell t))))

;; kind-icon: show icons in the corfu popup (like company-kind icons)
(use-package kind-icon
  :ensure t
  :after corfu
  :custom
  (kind-icon-default-face 'corfu-default)
  :config
  (add-to-list 'corfu-margin-formatters #'kind-icon-margin-formatter))

(provide 'use-corfu)
;;; use-corfu.el ends here
