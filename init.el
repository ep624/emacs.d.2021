;; init --- emacs config
;;; Commentary:
;;; Code:
;; (package-initialize)

;; increase garbage collection limit
(add-to-list 'load-path "~/.emacs.d/org-mode/lisp")
(require 'org-loaddefs)
(setq gc-cons-threshold 800000)

(let ((default-directory user-emacs-directory))
  (add-to-list 'load-path (expand-file-name "init-helpers")))
(setq confirm-kill-emacs 'y-or-n-p)

;(require 'lentic)
(load-library "init-helpers")
(init-set-custom)
(manage-toolbar-and-menubar)
(manage-history)
;;(set-window-system-font)
(setq debug-on-error nil)
(setq frame-title-format '("%b %I %+%@%t%Z %m %n %e"))

(let ((default-directory user-emacs-directory))
  (normal-top-level-add-subdirs-to-load-path))
(require 'elpa-init)

;; Explicit Requires ...
(dolist (lib '(custom-keys
               diff-region
               teletype-text
               kill-buffer-without-confirm
               resize-window
               scroll-bell-fix
               squeeze-view
               switch-window
               xterm-256-to-hex
;;               text-transformers
;;               make-yasnippet-from-region
               markdown-extras-ocodo
               memory-values
               zappers
               html-entity-helper
;;               emoji-cheatsheet
;;               tr
;;               kbd-gfm
;;               packages-outdated-packages
;;               date-thing
               ))
  (require lib))

(dolist (use-file
         (directory-files (ocodo-active-config-directory)))
  (load-use-file use-file))

(add-to-list 'load-path "~/.emacs.d/local/")
(add-to-list 'load-path "~/.emacs.d/personal/")


;; This is set by some packages erroneously. (e.g. AsciiDoc)
;; send fix patches to package authors who do this.

(setq debug-on-error nil)

(load-local-init)

;; Optional init modes (for example those which contain security
;; keys/tokens) - These files are added to .gitignore and only loaded
;; when present.
;; (mapcar 'load-optional-use-file '( ... list of optionals ... ))

;;; init.el ends here
