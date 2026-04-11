;;; init-helpers.el --- Initialization helpers -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

(require 'quick-init-helpers)

(defun ocodo-active-config-directory ()
  "Where active package configurations are kept."
  (format "%s_activated/" user-emacs-directory))

(defun load-local-init ()
  "Load local init if found."
  (let ((local-init (concat user-emacs-directory "local/init.el")))
    (when (file-readable-p local-init)
      (load-file local-init))))

(defun load-use-file (name)
  "Load a use file NAME; warn if it doesn't map to an existing file."
  (let ((file (concat (ocodo-active-config-directory) name)))
    (unless (or (equal name ".") (equal name ".."))
      (message "Using config: %s" file)
      (if (file-exists-p file)
          (load-file file)
        (message "Warning: %s doesn't exist" file)))))

(defun load-optional-use-file (name)
  "Check for existence of a use script NAME, and load if found."
  (let ((file (format "%suse-%s.el"
                      (ocodo-active-config-directory)
                      (symbol-name name))))
    (if (file-readable-p file)
        (progn
          (load-file file)
          (message "Optional use-file: %s, was loaded" name))
      (message "Optional use-file: %s, not found" name))))

(provide 'init-helpers)
;;; init-helpers.el ends here
