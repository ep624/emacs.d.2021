# Quick start guide...

This is a use-package based emacs configuration adapted from https://github.com/ocodo/.emacs.d

## Install emacs (if not done already)

Make sure that emacs is installed on your system.

- On Manjaro with paru installed, you can use `paru -S emacs-git` to install the latest version of emacs.
- On Debian/Ubuntu/Linux Mint, use 'apt install emacs' to install the
  version in your distribution repositories, or use instructions
  [here](https://www.emacswiki.org/emacs/EmacsSnapshotAndDebian) to install the latest version.
- (Untested) On OS X with homebrew, use the following

  ```
  brew tap d12frosted/emacs-plus
  brew install emacs-plus@29
  ```


## Configure emacs

Clone this repository:

  ```
  mv ~/.emacs.d ~/.emacs.d.old  ## Move your existing emacs configuration, if any
  git clone --recurse-submodules https://github.com/ep624/emacs.d.2021.git ~/.emacs.d
  cd ~/.emacs.d/org-mode
  make
  ```

You might need to start emacs a couple of times before all the necessary emacs libraries are downloaded and added. If some libraries are not automatically installed and you get errors, you can install them using `M-x package-install libraryname`

## Package/Feature configuration

All emacs packages configurations are in `~/.emacs.d/_configs` and enabled by
symlinking to `~/.emacs.d/_activated`.

You can add packages from Elpa, and customisations to `local/init.el`,
these will run after `init.el` has finished.


## Local Config

To add localised config, create and use the folder `./local/`

Add general config to `./local/init.el`

Customize will write to (and load from) `./local/custom.el` if you add
it before startup.

Copy `./custom/custom.el` to `./local/custom.el` if you want to start
from the same state as the general config.


## Local Color Theme Persistence

You color-theme selection is always stored locally, in
~/.emacs-theme - initially this will be non-existent or empty.

After first running Emacs with this config, simply run:

    M-x helm-themes

Now select a theme from the list.

Your selection will be saved, and untouched by upstream.
