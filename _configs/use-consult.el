;;; use-consult.el --- Initialize consult -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

(use-package consult
  :ensure t
  :bind (;; C-c bindings
         ("C-c b"   . consult-bookmark)
         ("C-c k"   . consult-kmacro)
         ;; C-x bindings
         ("C-x M-:" . consult-complex-command)
         ("C-x b"   . consult-buffer)
         ("C-x 4 b" . consult-buffer-other-window)
         ("C-x 5 b" . consult-buffer-other-frame)
         ;; Register bindings
         ("M-#"     . consult-register-load)
         ("M-'"     . consult-register-store)
         ("C-M-#"   . consult-register)
         ;; Other
         ("M-y"     . consult-yank-pop)
         ;; M-g goto bindings
         ("M-g e"   . consult-compile-error)
         ("M-g f"   . consult-flycheck)
         ("M-g g"   . consult-goto-line)
         ("M-g M-g" . consult-goto-line)
         ("M-g o"   . consult-outline)
         ("M-g m"   . consult-mark)
         ("M-g k"   . consult-global-mark)
         ("M-g i"   . consult-imenu)
         ("M-g I"   . consult-imenu-multi)
         ;; M-s search bindings
         ;; M-s a / M-s A are affe (see use-vertico-affe.el)
         ("M-s f"   . consult-fd)           ;; structured fd find with preview
         ("M-s g"   . consult-grep)
         ("M-s G"   . consult-git-grep)
         ("M-s r"   . consult-ripgrep)      ;; structured ripgrep with preview
         ("M-s l"   . consult-line)         ;; current buffer
         ("M-s L"   . consult-line-multi)
         ("M-s k"   . consult-keep-lines)
         ("M-s u"   . consult-focus-lines)
         ("M-s e"   . consult-isearch-history)
         ("C-s"     . consult-line)         ;; replaces isearch
         :map isearch-mode-map
         ("M-e"     . consult-isearch-history)
         ("M-s e"   . consult-isearch-history)
         ("M-s l"   . consult-line)
         ("M-s L"   . consult-line-multi))

  :hook (completion-list-mode . consult-preview-at-point-mode)

  :init
  (setq register-preview-delay 0
        register-preview-function #'consult-register-format)
  (advice-add #'register-preview :override #'consult-register-window)
  (setq xref-show-xrefs-function #'consult-xref
        xref-show-definitions-function #'consult-xref)

  :config
  (consult-customize
   consult-theme
   :preview-key '(:debounce 0.2 any)
   consult-ripgrep consult-git-grep consult-grep consult-fd
   consult-bookmark consult-recent-file consult-xref
   consult--source-bookmark consult--source-file-register
   consult--source-recent-file consult--source-project-recent-file
   :preview-key '(:debounce 0.4 any))

  (setq consult-narrow-key "<")

  ;; Use projectile for project root detection
  (autoload 'projectile-project-root "projectile")
  (setq consult-project-root-function #'projectile-project-root))

(provide 'use-consult)
;;; use-consult.el ends here
