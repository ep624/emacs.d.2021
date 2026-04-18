;;; use-tree-sitter.el --- Initialize native treesit and code folding -*- lexical-binding: t; -*-
;;; Commentary:
;; Uses Emacs 29+ built-in treesit for syntax highlighting and code folding.
;; treesit-auto handles grammar auto-installation and -ts-mode activation.
;; treesit-fold provides folding for all supported languages.
;;
;; To manually install all grammars: M-x treesit-auto-install-all
;; To fold/unfold at point:         C-c f f
;; To open all folds:               C-c f O
;; To close all folds:              C-c f C
;;
;; SQL notes:
;;   tree-sitter-sql (DerekStride) is dialect-agnostic and covers both
;;   PostgreSQL and MariaDB/MySQL syntax in a single grammar.
;;   Set the SQLi product per session with: M-x sql-set-product
;;   or permanently via sql-connection-alist (see SQL section below).
;;; Code:

;; ---------------------------------------------------------------------------
;; Grammar sources
;; ---------------------------------------------------------------------------
;; treesit-auto handles installation, but explicit sources here ensure the
;; correct branches are used (important for sql which uses gh-pages).
;; Install all at once: M-x treesit-auto-install-all
;; Or individually:     M-x treesit-install-language-grammar

(setq treesit-language-source-alist
      '(;; --- Languages you use most ---
        (r          "https://github.com/r-lib/tree-sitter-r")
        (python     "https://github.com/tree-sitter/tree-sitter-python")
        (bash       "https://github.com/tree-sitter/tree-sitter-bash")
        (elisp      "https://github.com/Wilfred/tree-sitter-elisp")
        ;; --- SQL: single grammar covering PostgreSQL, MariaDB/MySQL, SQLite ---
        ;; Parser artifacts live on gh-pages branch (not main)
        (sql        "https://github.com/DerekStride/tree-sitter-sql" "gh-pages")
        ;; --- Data formats ---
        (json       "https://github.com/tree-sitter/tree-sitter-json")
        (yaml       "https://github.com/ikatyang/tree-sitter-yaml")
        (toml       "https://github.com/tree-sitter/tree-sitter-toml")
        (markdown   "https://github.com/ikatyang/tree-sitter-markdown")
        ;; --- Web ---
        (javascript "https://github.com/tree-sitter/tree-sitter-javascript" "master" "src")
        (typescript "https://github.com/tree-sitter/tree-sitter-typescript" "master" "typescript/src")
        (tsx        "https://github.com/tree-sitter/tree-sitter-typescript" "master" "tsx/src")
        (css        "https://github.com/tree-sitter/tree-sitter-css")
        (html       "https://github.com/tree-sitter/tree-sitter-html")
        ;; --- Systems / scripting ---
        (lua        "https://github.com/Azganoth/tree-sitter-lua")
        (ruby       "https://github.com/tree-sitter/tree-sitter-ruby")
        (c          "https://github.com/tree-sitter/tree-sitter-c")
        (cpp        "https://github.com/tree-sitter/tree-sitter-cpp")
        (cmake      "https://github.com/uyha/tree-sitter-cmake")
        (make       "https://github.com/alemuller/tree-sitter-make")))

;; ---------------------------------------------------------------------------
;; Built-in treesit
;; ---------------------------------------------------------------------------
(use-package treesit
  :ensure nil
  :config
  (setq treesit-font-lock-level 4))

;; ---------------------------------------------------------------------------
;; treesit-auto: auto-activate -ts-modes and prompt-install grammars
;; ---------------------------------------------------------------------------
(use-package treesit-auto
  :ensure t
  :custom
  (treesit-auto-install 'prompt)
  :config
  (treesit-auto-add-to-auto-mode-alist 'all)
  (global-treesit-auto-mode))

;; ---------------------------------------------------------------------------
;; SQL: wire up sql-mode with the tree-sitter grammar and SQLi products
;; ---------------------------------------------------------------------------
;; There is no built-in sql-ts-mode in Emacs yet. We set up the grammar
;; parser manually for sql-mode so treesit-fold and font-lock work.
(use-package sql
  :ensure nil  ; built-in
  :config
  ;; Enable tree-sitter parser in sql-mode buffers when grammar is available
  (add-hook 'sql-mode-hook
            (lambda ()
              (when (treesit-language-available-p 'sql)
                (treesit-parser-create 'sql))))

  ;; Default product — change to 'mysql for MariaDB
  (setq sql-product 'postgres)

  ;; Connection profiles — fill in your own credentials.
  ;; Use M-x sql-connect to connect by name.
  ;; (setq sql-connection-alist
  ;;       '((local-postgres
  ;;          (sql-product 'postgres)
  ;;          (sql-server "localhost")
  ;;          (sql-port 5432)
  ;;          (sql-database "mydb")
  ;;          (sql-user "vikas"))
  ;;         (local-mariadb
  ;;          (sql-product 'mysql)   ; MariaDB is wire-compatible with mysql
  ;;          (sql-server "localhost")
  ;;          (sql-port 3306)
  ;;          (sql-database "mydb")
  ;;          (sql-user "vikas"))))

  ;; Prompt for product when opening a SQLi session if not already set
  (setq sql-set-sqli-hook nil))

;; ---------------------------------------------------------------------------
;; treesit-fold: structural code folding for all supported languages
;; ---------------------------------------------------------------------------
;; Supports R, Python, Bash, Elisp, SQL, JSON, YAML, Ruby, C/C++,
;; JavaScript, TypeScript, Lua, CSS, HTML, Markdown and many more.
(use-package treesit-fold
  :vc (:url "https://github.com/emacs-tree-sitter/treesit-fold")
  :ensure t
  :after treesit
  :config
  (global-treesit-fold-mode)
  ;; Show fold indicators in the fringe so foldable blocks are visible
  (global-treesit-fold-indicators-mode)
  ;; Define C-c f as a global prefix so Emacs reads the full key sequence.
  ;; Without this, Emacs stops at C-c f and never consults the minor mode map.
  (define-prefix-command 'treesit-fold-prefix)
  (global-set-key (kbd "C-c f") 'treesit-fold-prefix)
  (bind-key "f" #'treesit-fold-toggle    treesit-fold-prefix)
  (bind-key "o" #'treesit-fold-open      treesit-fold-prefix)
  (bind-key "O" #'treesit-fold-open-all  treesit-fold-prefix)
  (bind-key "c" #'treesit-fold-close     treesit-fold-prefix)
  (bind-key "C" #'treesit-fold-close-all treesit-fold-prefix))

;; ---------------------------------------------------------------------------
;; Explicit mode hooks — belt-and-suspenders in case global mode loads late
;; ---------------------------------------------------------------------------
(dolist (mode-hook '(;; R
                     r-ts-mode-hook
                     ess-r-mode-hook
                     ;; Python
                     python-ts-mode-hook
                     ;; Shell
                     bash-ts-mode-hook
                     sh-mode-hook
                     ;; SQL (no sql-ts-mode yet; fold via parser created above)
                     sql-mode-hook
                     ;; Lisp / Emacs
                     emacs-lisp-mode-hook
                     ;; Data formats
                     json-ts-mode-hook
                     yaml-ts-mode-hook
                     toml-ts-mode-hook
                     markdown-mode-hook
                     ;; Web
                     js-ts-mode-hook
                     typescript-ts-mode-hook
                     css-ts-mode-hook
                     ;; Systems / scripting
                     ruby-ts-mode-hook
                     c-ts-mode-hook
                     c++-ts-mode-hook
                     lua-mode-hook))
  (add-hook mode-hook #'treesit-fold-mode))

;; ---------------------------------------------------------------------------
;; vimish-fold: fold arbitrary selected regions
;; ---------------------------------------------------------------------------
;; Select any region and fold it — works for multi-line ( ) blocks,
;; data.table chains, or anything else treesit-fold can't handle.
;;
;; Keybindings (C-c v prefix):
;;   C-c v f   fold selected region
;;   C-c v u   unfold at point
;;   C-c v U   unfold all in buffer
;;   C-c v d   delete fold at point
;;   C-c v D   delete all folds in buffer
;;   C-c v n   next fold
;;   C-c v p   previous fold
;;
;; Folds persist across sessions via vimish-fold-save/restore.
(use-package vimish-fold
  :ensure t
  :config
  (vimish-fold-global-mode 1)

  (define-prefix-command 'vimish-fold-prefix)
  (global-set-key (kbd "C-c v") 'vimish-fold-prefix)
  (bind-key "f" #'vimish-fold                  vimish-fold-prefix)
  (bind-key "u" #'vimish-fold-unfold           vimish-fold-prefix)
  (bind-key "U" #'vimish-fold-unfold-all       vimish-fold-prefix)
  (bind-key "d" #'vimish-fold-delete           vimish-fold-prefix)
  (bind-key "D" #'vimish-fold-delete-all       vimish-fold-prefix)
  (bind-key "n" #'vimish-fold-next-fold        vimish-fold-prefix)
  (bind-key "p" #'vimish-fold-previous-fold    vimish-fold-prefix))

(provide 'use-tree-sitter)
;;; use-tree-sitter.el ends here
