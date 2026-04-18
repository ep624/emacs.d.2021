;;; use-flycheck.el --- Initialize flycheck and per-language linters -*- lexical-binding: t; -*-
;;; Commentary:
;; eglot diagnostics are bridged through flycheck via flycheck-eglot so
;; only one diagnostics UI is active at a time.
;;; Code:

(use-package flycheck
  :ensure t
  :config
  ;; --- Global defaults ---
  (setq flycheck-indication-mode        'left-fringe
        flycheck-check-syntax-automatically '(save mode-enabled)
        flycheck-highlighting-mode      'symbols
        flycheck-idle-change-delay      1.0)

  ;; --- R / lintr ---
  ;; Updated to modern linters_with_defaults syntax.
  (setq flycheck-lintr-linters
        (concat "linters_with_defaults("
                "line_length_linter(120L),"
                "object_name_linter = NULL,"
                "object_length_linter = NULL,"
                "cyclocomp_linter = NULL"
                ")"))

  ;; --- Python / ruff ---
  (setq flycheck-python-ruff-config nil)

  ;; --- Mode hooks ---
  (add-hook 'prog-mode-hook #'flycheck-mode)
  (add-hook 'css-mode-hook  #'flycheck-mode)

  (add-hook 'python-mode-hook
            (lambda ()
              (when (executable-find "ruff")
                (flycheck-select-checker 'python-ruff))))
  (add-hook 'python-ts-mode-hook
            (lambda ()
              (when (executable-find "ruff")
                (flycheck-select-checker 'python-ruff)))))

;; --- Eglot Configuration ---
;; This is the CRITICAL fix. It tells the R Language Server to stay
;; silent about diagnostics so they don't override your 120-char lintr rule.
(setq-default eglot-workspace-configuration
              '(:r (:lsp (:diagnostics :json-false))))

;; --- R Auto-Formatting (styler) ---
(use-package reformatter
  :ensure t
  :config
  (reformatter-define r-styler
    :program "Rscript"
    :args (list "-e" "suppressMessages(suppressWarnings(styler::style_text(readLines(file('stdin')), scope = 'extra')))")
    :stdin t
    :stdout t)
  ;; Automatically format R files on save
  (add-hook 'ess-r-mode-hook 'r-styler-on-save-mode)
  ;; Refresh flycheck markers immediately after styling
  (add-hook 'r-styler-after-format-hook #'flycheck-buffer))

;; --- flycheck-eglot ---
(use-package flycheck-eglot
  :ensure t
  :after (flycheck eglot)
  :config
  (global-flycheck-eglot-mode 1))

;; --- flycheck-posframe ---
(use-package flycheck-posframe
  :ensure t
  :after flycheck
  :hook (flycheck-mode . flycheck-posframe-mode)
  :config
  (setq flycheck-posframe-position    'point-bottom-left-corner
        flycheck-posframe-border-width 1))

(provide 'use-flycheck)
;;; use-flycheck.el ends here
