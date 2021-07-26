;;; use-multiple-cursors --- initialize multiple cursors
;;; Commentary:
;;; Code:
(require 'use-package)
(cua-selection-mode 1)
(use-package multiple-cursors
  :ensure t
  :bind
  (("C->" . mc/mark-next-like-this)
   ("C-<" . mc/mark-all-like-this)
   ("C-c C-<" . mc/mark-previous-like-this))

  :init
  (progn
    (define-key cua-global-keymap [C-return] nil)
    (define-key cua--rectangle-keymap (kbd "M-U") 'mc/cua-rectangle-to-multiple-cursors)))

(provide 'use-multiple-cursors)
;;; use-multiple-cursors.el ends here
