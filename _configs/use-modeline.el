;;; use-modeline.el --- Clean up the mode line -*- lexical-binding: t; -*-
;;; Commentary:
;; http://blog.jr0cket.co.uk/2013/01/tweeking-emacs-modeline-for-clojure.html
;;; Code:

(require 'cl-lib)

(use-package yasnippet :ensure t)

(defvar mode-line-cleaner-alist
  `((yas-minor-mode . " γ")
    (paredit-mode . " Φ")
    (eldoc-mode . "")
    (abbrev-mode . "")
    (whitespace-mode . " б")
    (undo-tree-mode . " τ")
    (volatile-highlights-mode . " υ")
    (elisp-slime-nav-mode . " δ")
    (nrepl-mode . " ηζ")
    (nrepl-interaction-mode . " ηζ")
    (projectile-mode . " п")
    (ropemacs-mode . " р")
    (rainbow-mode . " ιρις")
    (flymake-mode . " ικαρ")
    (elpy-mode . " επ")
    ;; Major modes
    (clojure-mode . "Λ")
    (hi-lock-mode . "")
    (python-mode . "Π")
    (emacs-lisp-mode . "ЕЛ")
    (lisp-interaction-mode . "Λ")
    (markdown-mode . "📓")
    (coffee-mode . "☕")
    (less-css-mode . ""))
  "Alist for `clean-mode-line'.
When you add a new element to the alist, keep in mind that you
must pass the correct minor/major mode symbol and a string you
want to use in the modeline *in lieu of* the original.")

(defun clean-mode-line ()
  (interactive)
  (cl-loop for cleaner in mode-line-cleaner-alist
           do (let* ((mode (car cleaner))
                     (mode-str (cdr cleaner))
                     (old-mode-str (cdr (assq mode minor-mode-alist))))
                (when old-mode-str
                  (setcar old-mode-str mode-str))
                (when (eq mode major-mode)
                  (setq mode-name mode-str)))))

(add-hook 'after-change-major-mode-hook 'clean-mode-line)

(provide 'use-modeline)
;;; use-modeline.el ends here
