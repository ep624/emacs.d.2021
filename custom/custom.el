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
 '(display-time-world-time-format "%A %d %B %R %Z (%z)")
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
 '(linum-delay t)
 '(linum-eager nil)
 '(lua-indent-level 2)
 '(make-backup-files nil)
 '(markdown-css-path "http://bootswatch.com/simplex/bootstrap.css")
 '(newsticker-url-list
   '(("Hacker News" "https://news.ycombinator.com/rss" nil nil nil)
     ("Emacs Reddit" "http://www.reddit.com/r/emacs.rss" nil nil nil)))
 '(package-selected-packages
   '(yasnippet-snippets dashboard erc-image erc-hl-nicks org-gcal pinentry pineentry none epa-file artbollocks-mode elfeed-score elfeed which-key super-save zenburn-theme persistent-scratch ido-vertical-mode iedit dired-subtree highlight-indentation pos-tip helm doi-utils org-plus-contrib undo-tree undohist org-sticky-header org-tempo ox-extra ox-publish ox-html ox-odt ox-beamer bibretrieve cdlatex pdf-tools helm-bibtex org-super-agenda ts quelpa-use-package quelpa zossima zone-sl zlc zenity-color-picker zencoding-mode yaoddmuse yalinum yagist xterm-frobs xterm-color xkcd xcode-project wrap-region wotd workgroups wordsmith-mode wiki-summary white-theme wgrep-pt wgrep-ag wgrep-ack watch-buffer waher-theme vue-mode vkill visual-regexp-steroids vimrc-mode verify-url vector-utils vdirel vagrant unicode-progress-reporter unicode-input unicode-enbox unicode-emoticons ubuntu-theme typing typed-clojure-mode twittering-mode twilight-theme twilight-bright-theme twilight-anti-bright-theme tss trr toggle togetherly tle timonier thesaurus textmate-to-yas textile-mode tern-context-coloring tern-auto-complete termbright-theme ten-hundred-mode template-overlays tech49-theme tblui tabulated-list tabula-rasa synonymous sx suggestion-box suggest suede-shoes-theme stylus-mode stripe-buffer status ssh-tunnels sr-speedbar spu splitjoin speed-type spacegray-theme sort-words soothe-theme soarers-converter-mode smyx-theme sml-modeline smeargle smart-operator slime-theme slim-mode skewer-reload-stylesheets sicp showkey show-css shoulda shift-number sexp-move seti-theme seoul256-theme select-themes sed-mode scss-mode sass-mode s-buffer ruby-tools ruby-refactor ruby-interpolation ruby-end ruby-dev ruby-block robots-txt-mode rnc-mode ripgrep rinari rhuk-theme rhtml-mode reveal-in-osx-finder restclient-helm resesif-boned-theme requirejs-mode replace-pairs remember-themes relative-line-numbers refine redis rainbow-mode rainbow-identifiers railscasts-theme rails-log-mode purple-haze-theme pt project-explorer professional-theme pretty-mode point-stack plain-theme pivotal-tracker pickle php+-mode peepopen peek-mode peacock-theme pbcopy pastelmac-theme parse-csv parinfer paren-completer paradox ox-twbs ox-gfm osx-plist org-transform-tree-table org-sync org-projectile org-jekyll org-eww org-ac operate-on-number ocodo-svg-modelines occur-x ob-typescript nyx-theme nyan-prompt nyan-mode nurumacs nodejs-repl noctilux-theme noccur nlinum-relative niflheim-theme nginx-mode neotree nameless mustard-theme mustang-theme mustache-mode multi-web-mode multi-line mu4e-conversation move-text minibuffer-complete-cycle mellow-theme mediawiki md-readme mc-jump mc-extras mbo70s-theme mbo-theme marmalade markdown-mode+ main-line macrostep lusty-explorer lush-theme lorem-ipsum livid-mode livescript-mode literate-coffee-mode literal-string litable list-processes+ lispyscript-mode liso-theme linum-relative lines-at-once line-up-words less-css-mode lentic lein lavender-theme lacarte kurecolor kite-mini kite killer kill-ring-search kill-ring-ido keywiz key-combo karma kanban jss json-rpc json-pointer js3-mode js-comint jq-mode jist jira-markup-mode jira jenkins-watch jenkins jekyll-modes jasminejs-mode jade-mode j-mode iy-go-to-char ivy-youtube ivy-ycmd ivy-yasnippet ivy-xref ivy-xcdoc ivy-todo ivy-rtags ivy-purpose ivy-phpunit ivy-pass ivy-omni-org ivy-mpdel ivy-historian ivy-gitlab ivy-fuz ivy-explorer ivy-erlang-complete ivy-emoji ivy-emms ivy-clipmenu iterators ipretty ioccur intero inf-crystal impatient-mode igrep idomenu ido-yes-or-no ido-ubiquitous ido-select-window ido-occur ido-load-library ido-hacks ido-grid-mode ido-flex-with-migemo ido-describe-bindings ido-at-point icicles ibuffer-projectile ibuffer-git httprepl httpcode http-twiddle http-post-simple html5-schema homebrew-mode hl-spotlight hl-indent history hipster-theme hippie-exp-ext highlight-tail highlight-quoted highlight-numbers highlight-leading-spaces highlight-current-line hide-region hide-mode-line hide-comnt hi2 hexrgb heroku-theme heroku hemisu-theme hemera-theme help-mode+ help-fns+ helm-unicode helm-themes helm-spotify helm-smex helm-rubygems-org helm-rubygems-local helm-robe helm-rb helm-rails helm-pt helm-projectile-all helm-perldoc helm-open-github helm-make helm-lobsters helm-lastpass helm-j-cheatsheet helm-itunes helm-ispell helm-img helm-gtags helm-gitlab helm-gitignore helm-git-grep helm-git helm-gist helm-flymake helm-flycheck helm-flx helm-eww helm-emmet helm-dired-recent-dirs helm-dired-history helm-describe-modes helm-descbinds helm-delicious helm-dash helm-css-scss helm-commandlinefu helm-cmd-t helm-chrome helm-c-moccur helm-bundle-show helm-aws helm-ack header2 hc-zenburn-theme haskell-emacs harvest handlebars-mode ham-mode guide-key gtags gruber-darker-theme grep-o-matic grayscale-theme grapnel graphviz-dot-mode graphql grails gradle-mode goto-last-change goto-gem gorepl-mode goose-theme google-this google golint golden-ratio go-stacktracer go-snippets go-scratch go-projectile go-playground-cli go-gopath go-errcheck go-dlv go-direx go-complete go-autocomplete go-add-tags gnu-apl-mode gitignore-templates github-stars github-issues github-elpa github-browse-file gitconfig git-lens git-gutter-fringe+ general fxrd-mode format-sql font-lock+ fold-this focus flyparens flymake-yaml flymake-vala flymake-shell flymake-sass flymake-rust flymake-ruby flymake-python-pyflakes flymake-lua flymake-json flymake-jslint flymake-jshint flymake-haskell-multi flymake-haml flymake-go flymake-elixir flymake-css flymake-coffee flymake-checkers flycheck-ycmd flycheck-tip flycheck-rust flycheck-pkg-config flycheck-ocaml flycheck-jest flycheck-cython flycheck-css-colorguard flycheck-crystal flycheck-color-mode-line flycheck-clojure flycheck-ameba flx-isearch flex-isearch flex-autopair flatui-theme flatland-theme flatland-black-theme flash-region firecode-theme firebelly-theme fiplr find-file-in-git-repo finalize filladapt figlet fancy-narrow fancy-battery evil-visualstar evil-visual-mark-mode evil-tutor evil-textobj-column evil-tabs evil-space evil-smartparens evil-search-highlight-persist evil-rsi evil-paredit evil-lisp-state evil-lion evil-leader evil-jumper evil-indent-textobject evil-god-state evil-exchange evil-easymotion evil-args evil-anzu etable eshell-git-prompt es6-mocha-yasnippets eno embrace emamux elog elmine elm-yasnippets elixir-yasnippets elixir-mix elisp-format elisp-docstring-mode elein el2markdown el-x el-spec el-search el-mock ego edit-server edit-list earthsong-light-theme dropdown-list dotenv-mode docker-mode docker-api docean discover-my-major dirtree diredfl dired-ranger dired-nav-enhance dired-narrow dired-filter dired-efap dired-dups dired-du dired-details+ dired+ diminish dim digitalocean diffview describe-number deep-thought-theme db-pg darkmine-theme darkburn-theme dark-krystal-theme darcula-theme dakrone-theme cucumber-goto-step ctags-update ctags csv-nav csv-mode crosshairs crisp creamsody-theme counsel-osx-app counsel-notmuch counsel-codesearch company-ycmd company-tern company-statistics company-restclient company-lsp company-inf-ruby company-flx company-dict company-cmake common-lisp-snippets comment-tags command-t command-log-mode command-frequency column-marker column-enforce-mode colormaps color-theme-sanityinc-solarized color-theme-railscasts colonoscopy-theme coffee-fof clues-theme closure-template-html-mode closure-lint-mode clojurescript-mode clojure-test-mode clojure-snippets clojure-project-mode clojure-cheatsheet cl-lib-highlight cl-format circadian ciapre-theme ciapre-black-theme chm-view chef-mode checkbox cheatsheet cbm cabledolphin c-c-combo butler busybee-theme buster-snippets buster-mode bundler buffer-watcher bubbleberry-theme bpr boron-theme borland-blue-theme bone-a-kite-theme bliss-theme birds-of-paradise-theme birds-of-paradise-plus-theme bespin-theme bbyac basic-c-compile back-button awk-it avy-zap avy-flycheck autopair auto-yasnippet auto-correct auto-complete-nxml auto-complete-exuberant-ctags aurora-theme auctex atom-one-dark-theme atom-dark-theme asciidoc ascii-art-to-unicode apt-sources-list applescript-mode apples-mode apache-mode aok ant ansible-doc ansible annoying-arrows-mode angularjs-mode angular-snippets angular-mode android-mode anaphora anaconda-mode ample-zen-theme ample-theme ameba all-the-icons-ivy-rich all-the-icons-ivy all-the-icons-ibuffer all-the-icons-gnus all-the-icons-dired all-ext align-cljlet airplay ahg aggressive-indent aggressive-fill-paragraph ag adoc-mode adafruit-wisdom actionscript-mode ack-menu ack-and-a-half ack achievements ace-mc ace-link ace-jump-zap ace-jump-buffer ace-isearch ace-flyspell academic-phrases ac-nrepl ac-nim ac-js2 ac-ispell ac-inf-ruby ac-html-csswatcher ac-html-bootstrap ac-html-angular ac-html ac-etags ac-emmet ac-dabbrev ac-cider ac-alchemist 4clojure 2048-game 0xc 0blayout))
 '(paradox-automatically-star t)
 '(paradox-github-token t)
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
           (global-set-key "i" 'iedit-mode))
     (rainbow-mode . 1)
     (rainbow-mode . t)
     (eval when
           (fboundp 'rainbow-mode)
           (rainbow-mode 1))
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
 '(yas-prompt-functions
   '(yas-dropdown-prompt yas/x-prompt yas/completing-prompt yas/ido-prompt yas/no-prompt)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(dashboard-banner-logo-title ((t (:family "Love LetterTW" :height 123)))))
