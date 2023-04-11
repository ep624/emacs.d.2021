;;; use-dired --- initialize dired
;;; Commentary:
;;; Code:
(require 'use-package)

(use-package dired
  :init
  (progn
;;    (use-package dired-details+ :ensure t)
    (use-package dirtree :ensure t)

    (bind-key "C-x C-d" 'ido-dired)

;;    (setq dired-details-initially-hide nil)

    (defun my-dired-find-file (&optional arg)
      "Open each of the marked files, or the file under the point, or when prefix arg, the next N files "
      (interactive "P")
      (let* ((fn-list (dired-get-marked-files nil arg)))
        (mapc 'find-file fn-list)))

;;    (add-hook 'dired-after-readin-hook #'(lambda () (dired-details-activate)))

    (add-hook 'dired-mode-hook #'(lambda ()
                                   (visual-line-mode 0)
;;                                   (linum-mode 0)
                                   (auto-revert-mode))))
  :custom
  ;; Always delete and copy recursively
  (dired-recursive-deletes 'always)
  (dired-recursive-copies 'always)
  ;; Auto refresh Dired, but be quiet about it
  (global-auto-revert-non-file-buffers t)
  (auto-revert-verbose nil)
  ;; Quickly copy/move file in Dired
  (dired-dwim-target t)
  ;; Move files to trash when deleting
  (delete-by-moving-to-trash t)

  :bind (:map dired-mode-map
              ("W" . wdired-change-to-wdired-mode)
              ("F" . my-dired-find-file))
  :hook
  (dired-mode . (lambda ()
                  (local-set-key (kbd "<mouse-2>") #'dired-find-alternate-file)
                  (local-set-key (kbd "RET") #'dired-find-alternate-file)
                  (local-set-key (kbd "^")
                                 (lambda () (interactive) (find-alternate-file "..")))))
  :config
  ;; Reuse same dired buffer, to prevent numerous buffers while navigating in dired
  (put 'dired-find-alternate-file 'disabled nil))

;; DiredConfigs
;; Load the newest version of a file
(setq load-prefer-newer t)

;; Detect external file changes and auto refresh file
(global-auto-revert-mode t)

;; Transparently open compressed files
(auto-compression-mode t)


(provide 'use-dired)
;;; use-dired ends here
