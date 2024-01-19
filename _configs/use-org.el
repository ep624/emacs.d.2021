;;; use-org --- initialize org
;;; Commentary:
;;; Code:



;; (use-package org
;; ;;  :load-path "/org-mode"
;;   :ensure org-plus-contrib
;;   :pin org
;;   :bind (("C-c a" . org-agenda)
;;          ("C-c c" . org-capture)
;;          ("C-c l" . org-store-link))
;;   :config
;;(unbind-key "C-c ;" org-mode-map)


;;set priority range from A to C with default A
(setq org-highest-priority ?A)
(setq org-lowest-priority ?C)
(setq org-default-priority ?A)
(setq epa-pinentry-mode 'loopback)

;;set colours for priorities
(setq org-priority-faces '((?A . (:foreground "OliveDrab" :weight bold))
                           (?B . (:foreground "LightSteelBlue"))
                           (?C . (:foreground "#F0DFAF"))))



;; (defun my/org-mode-defaults ()
;;   (turn-on-org-cdlatex)
;;   ;; (diminish 'org-cdlatex-mode "")
;;   (turn-on-auto-fill)

;;   ;; make `company-backends' local is critcal
;;   ;; or else, you will have completion in every major mode, that's very annoying!
;;   (make-local-variable 'company-backends)
;;   ;; company-ispell is the plugin to complete words
;;   (add-to-list 'company-backends 'company-ispell))

;; (add-hook 'org-mode-hook 'my/org-mode-defaults)

;; Fontify org-mode code blocks
(setq org-src-fontify-natively t)
(setq org-confirm-babel-evaluate nil)
(setq org-startup-indented t)
(setq org-src-tab-acts-natively t)
(setq org-export-with-smart-quotes t)
(setq org-cycle-include-plain-lists t)
(setq org-hide-leading-stars t)
(setq org-alphabetical-lists t)
(setq org-publish-use-timestamps-flag t)
(setq org-image-actual-width nil)
(add-hook 'org-mode-hook 'turn-off-auto-fill)
(add-hook 'org-mode-hook 'turn-on-visual-line-mode)

(setq org-export-async-init-file "~/.emacs.d/emacsasync.el")

;; spell-check in org mode buffers

(add-hook 'org-mode-hook 'flyspell-mode)
(add-hook 'org-mode-hook 'flyspell-buffer)

(setq flyspell-issue-message-flag nil)

(add-hook 'org-mode-hook (lambda () (setq ispell-parser 'tex)))
(defun flyspell-ignore-tex ()
  (interactive)
  (set (make-variable-buffer-local 'ispell-parser) 'tex))
(add-hook 'org-mode-hook 'flyspell-ignore-tex)

(prefer-coding-system 'utf-8)
(set-charset-priority 'unicode)
(setq default-process-coding-system '(utf-8-unix . utf-8-unix))

(org-add-link-type
 "color" nil
 (lambda (path desc format)p
  (cond
   ((eq format 'html)
    (format "<span style=\"color:%s;\">%s</span>" path desc))
   ((eq format 'latex)
    (format "{\\color{%s}%s}" path desc)))))

(org-add-link-type
 "hl" nil
 (lambda (path desc format)
  (cond
   ((eq format 'html)
    (format "<font style=\"background-color:%s;\">%s</font>" path desc))
   ((eq format 'latex)
    (format "\\colorbox{%s}{%s}" path desc))))) ;; require \usepackage{color}

(setq org-agenda-include-diary t)

(setq org-refile-targets (quote ((nil :maxlevel . 2)
                                 (org-agenda-files :maxlevel . 2))))
                                        ; Stop using paths for refile targets - we file directly with IDO
(setq org-refile-use-outline-path t)
(setq org-refile-allow-creating-parent-nodes (quote confirm)) ; Allow refile to create parent tasks with confirmation

(setq org-todo-keywords
      (quote ((sequence "TODO(t)" "|" "CANCELLED(c@/!)" "DONE(d)"))))

(setq org-use-fast-todo-selection t)
(setq org-treat-S-cursor-todo-selection-as-state-change nil)

(setq org-todo-keyword-faces
      '(("TODO" . (:foreground "green" :weight bold))
        ("NEXT" :foreground "blue" :weight bold)
        ("WAITING" :foreground "orange" :weight bold)
        ("HOLD" :foreground "magenta" :weight bold)
        ("CANCELLED" :foreground "forest green" :weight bold)))

(setq org-enforce-todo-dependencies t)

(use-package ob-async
  :after org
  :ensure t
  )

;; execute external programs.
(org-babel-do-load-languages
 (quote org-babel-load-languages)
 (quote ((emacs-lisp . t)
         (R . t)
         (org . t)
         (ditaa . t)
         (latex . t)
         (dot . t)
         (ditaa . t)
         (python . t)
         (gnuplot . t)
         ;;           (rec . t)
         (screen . nil)
         (shell . t)
         (sql . t)
         (latex . t)
         (sqlite . t))))

;; (eval-after-load 'org-src
;;   '(define-key org-src-mode-map
;;      "\C-x\C-s" #'org-edit-src-exit)))

(defun vikas/toggle-org-macro-markers ()
  "Toggle visibility of {{{macro}}} markers"
  (interactive)
  (setq org-hide-macro-markers (not org-hide-macro-markers))
  (font-lock-mode)
  (font-lock-mode))(defun wtd/toggle-org-macro-markers ()
  "Toggle visibility of {{{macro}}} markers"
  (interactive)
  (setq org-hide-macro-markers (not org-hide-macro-markers))
  (font-lock-mode)
  (font-lock-mode))


(provide 'use-org)
