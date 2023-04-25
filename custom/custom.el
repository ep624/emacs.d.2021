;; Customize stuff...
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(auto-install-save-confirm nil)
 '(blink-cursor-mode nil)
 '(column-number-mode t)
 '(css-indent-offset 2)
 '(cua-enable-cua-keys nil)
 '(cua-mode t nil (cua-base))
 '(current-language-environment "UTF-8")
 '(custom-safe-themes t)
 '(display-time-mode nil)
 '(ediff-custom-diff-program "diff")
 '(ediff-diff-program "diff")
 '(ediff-diff3-program "diff3")
 '(fci-rule-character-color "#202020")
 '(fci-rule-color "#202020")
 '(fiplr-ignored-globs
   '((directories
      (".git" ".svn" ".hg" ".bzr" "tmp" "log"))
     (files
      (".#*" "*~" "*.so" "*.jpg" "*.png" "*.gif" "*.pdf" "*.gz" "*.zip" ".DS_Store" ".gitkeep"))))
 '(fringe-mode 4 nil (fringe))
 '(glasses-original-separator "-")
 '(glasses-separate-parentheses-p nil)
 '(glasses-separator "-")
 '(glasses-uncapitalize-p t)
 '(global-auto-revert-mode t)
 '(global-hl-line-mode nil)
 '(global-undo-tree-mode t)
 '(grep-find-ignored-directories
   '("SCCS" "RCS" "CVS" "MCVS" ".svn" ".git" ".hg" ".bzr" "_MTN" "_darcs" "{arch}" "tmp" "log" "vendor"))
 '(indent-tabs-mode nil)
 '(indicate-buffer-boundaries 'right)
 '(inhibit-startup-screen t)
 '(initial-scratch-message nil)
 '(ispell-dictionary nil)
 '(js-indent-level 2)
 '(js3-enter-indents-newline t)
 '(js3-indent-level 2)
 '(jshint-configuration-path "~/.jshintrc")
 '(json-reformat:indent-width 2)
 '(lua-indent-level 2)
 '(main-line-color1 "#1E1E1E")
 '(main-line-color2 "#111111")
 '(main-line-separator-style 'chamfer)
 '(make-backup-files nil)
 '(markdown-css-path "http://bootswatch.com/simplex/bootstrap.css")
 '(newsticker-url-list
   '(("Hacker News" "https://news.ycombinator.com/rss" nil nil nil)
     ("Emacs Reddit" "http://www.reddit.com/r/emacs.rss" nil nil nil)))
 '(package-selected-packages
   '(zenburn-theme yasnippet-snippets which-key swiper super-save smartparens projectile persistent-scratch bibretrieve cdlatex org-ref pdf-tools key-chord helm-bibtex bibtex-completion biblio biblio-core f parsebib helm helm-core async htmlize org-sticky-header nameless multiple-cursors multi-web-mode move-text magit auctex kurecolor ivy iedit flx-ido ido-completing-read+ ido-vertical-mode highlight-indentation git-gutter eshell-git-prompt edit-server dirtree dired-subtree coffee-mode avy auto-complete anzu tblui epl yasnippet hydra ag quelpa-use-package))
 '(paradox-automatically-star t)
 '(paradox-github-token t)
 '(powerline-color1 "#1E1E1E")
 '(powerline-color2 "#111111")
 '(recentf-max-menu-items 30)
 '(recentf-max-saved-items 30)
 '(recentf-menu-title "Recent Files...")
 '(recentf-mode t)
 '(rinari-rails-env "development")
 '(safe-local-variable-values
   '((eval progn
           (message "Setting project specific key bindings")
           (global-set-key
            [24 down]
            'duplicate-current-line-or-region)
           (global-set-key "\3i" 'iedit-mode))
     (eval ignore-errors "Write-contents-functions is a buffer-local alternative to before-save-hook"
           (add-hook 'write-contents-functions
                     (lambda nil
                       (delete-trailing-whitespace)
                       nil))
           (require 'whitespace)
           "Sometimes the mode needs to be toggled off and on."
           (whitespace-mode 0)
           (whitespace-mode 1))
     (whitespace-line-column . 80)
     (whitespace-style face trailing lines-tail)
     (require-final-newline . t)))
 '(scroll-bar-mode nil)
 '(scss-compile-at-save nil)
 '(send-mail-function 'sendmail-send-it)
 '(tab-width 2)
 '(tabbar-background-color "grey20")
 '(tabbar-separator '(0.2))
 '(truncate-lines t)
 '(visible-bell t)
 '(whitespace- nil)
 '(window-left-margin 0)
 '(world-clock-time-format "%A %d %B %R %Z (%z)")
 '(yas-prompt-functions
   '(yas-dropdown-prompt yas/x-prompt yas/completing-prompt yas/ido-prompt yas/no-prompt)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(dashboard-banner-logo-title ((t (:family "Love LetterTW" :height 123)))))
