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

(setq org-latex-pdf-process
      '("xelatex -interaction nonstopmode -output-directory %o %f"
        "biber %b"
        "xelatex -interaction nonstopmode -output-directory %o %f"
        "xelatex -interaction nonstopmode -output-directory %o %f"))


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
         (ledger . t)
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

(require 'reftex)

(use-package cdlatex
  :ensure t
  :after reftex)

(use-package bibretrieve
  :after reftex
  :ensure t
  :config
  (setq bibretrieve-backends '(("citebase" . 10) ("mrl" . 10) ("arxiv" . 5) ("zbm" . 5)))
  (defun bibretrieve-scholar-create-url (author title)
    (let ((tempfile (make-temp-file "scholar" nil ".bib")))
      (call-process-shell-command "~/bin/gscholar/gscholar/gscholar.py --all" nil nil nil
                                  (if (> (length author) 0) (concat "\"" author "\""))
                                  (if (> (length title) 0)  (concat "\"" title "\""))
                                  (concat " > " tempfile))
      (concat "file://" tempfile)
      ))

  (defun bibretrieve-scholar ()
    (interactive)
    (setq mm-url-use-external t)
    (setq bibretrieve-backends '(("scholar" . 5)))
    (bibretrieve)
    (setq mm-url-use-external nil)
    )

  (defun bibretrieve-amazon-create-url (author title)
    (concat "http://lead.to/amazon/en/?key="(mm-url-form-encode-xwfu title) "&si=ble&op=bt&bn=&so=sa&ht=us"))
  (defun bibretrieve-amazon ()
    (interactive)
    (setq mm-url-use-external t)
    (setq mm-url-program "w3m")
    (setq mm-url-arguments (list "-dump"))
    (setq bibretrieve-backends '(("amazon" . 5)))
    (bibretrieve)
    (setq mm-url-use-external nil)
    )
  )

(provide 'use-org)
