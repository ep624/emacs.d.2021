;;; use-exec-path --- initialize exec-path
;;; Commentary:
;;; Code:

;; (message "setting up environment with exec-path")
;; (use-package exec-path-from-shell :ensure t)
;; (when (eq (getenv "SHELL") nil) (setenv "SHELL" "bash"))
;; (exec-path-from-shell-initialize)
;; (exec-path-from-shell-copy-env "SSH_AUTH_SOCK")
;; (setq exec-path-from-shell-initialize-done t)

(provide 'use-exec-path)
;;; use-exec-path ends here
