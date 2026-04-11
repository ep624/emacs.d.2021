;;; kill-buffer-without-confirm.el --- Kill buffer without confirmation -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

(defun kill-current-buffer ()
  "Kill the current buffer, without confirmation."
  (interactive)
  (kill-buffer (current-buffer)))

(require 'bind-key)

(bind-key "C-x k"'kill-current-buffer)

(provide 'kill-buffer-without-confirm)

;;; kill-buffer-without-confirm.el ends here
