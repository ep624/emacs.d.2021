;;; use-eaf --- initialize eaf -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

(use-package eaf
  :load-path "~/.emacs.d/site-lisp/emacs-application-framework"
  :custom
  ; See https://github.com/emacs-eaf/emacs-application-framework/wiki/Customization
  (eaf-browser-continue-where-left-off t)
  (eaf-browser-enable-adblocker t)
  (browse-url-browser-function 'eaf-open-browser)
  :config
  (defalias 'browse-web #'eaf-open-browser)
  (eaf-bind-key scroll_up "C-n" eaf-pdf-viewer-keybinding)
  (eaf-bind-key scroll_down "C-p" eaf-pdf-viewer-keybinding)
  (eaf-bind-key take_photo "p" eaf-camera-keybinding)
  (eaf-bind-key nil "M-q" eaf-browser-keybinding)) ;; unbind, see more in the Wiki


;; (setq bibtex-completion-pdf-open-function (lambda (fpath)
;;     (eaf-open fpath)))


(require 'eaf-file-browser)
(require 'eaf-camera)
(require 'eaf-file-sender)
(require 'eaf-pyqterminal)
(require 'eaf-airshare)
(require 'eaf-map)
(require 'eaf-file-manager)
(require 'eaf-browser)
(require 'eaf-video-player)
(require 'eaf-image-viewer)
(require 'eaf-system-monitor)
(require 'eaf-markdown-previewer)
(require 'eaf-git)
(require 'eaf-js-video-player)
(require 'eaf-org-previewer)
(require 'eaf-music-player)
(require 'eaf-rss-reader)
(require 'eaf-pdf-viewer)

(require 'eaf-interleave)
(add-hook 'eaf-pdf-viewer-hook 'eaf-interleave-app-mode)
(add-hook 'eaf-browser-hook 'eaf-interleave-app-mode)
(add-hook 'org-mode-hook 'eaf-interleave-mode)
(setq eaf-interleave-org-notes-dir-list '("~/org/interleave/"))
(setq eaf-interleave-split-direction 'vertical)
(setq eaf-interleave-disable-narrowing t)
(setq eaf-interleave-split-lines 20)

(provide 'use-eaf)

;;; use-eaf.el ends here
