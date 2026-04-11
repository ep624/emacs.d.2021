;;; use-json-mode.el --- Initialize json-mode -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:
(dolist (pattern '(
                   "\\.jshintrc\\'"

                   "\\.jslint\\'"

                   "\\.eslintrc\\'"

                   ))
  (add-to-list 'auto-mode-alist (cons pattern 'json-mode)))
(provide 'use-json-mode)

;;; use-json-mode.el ends here
