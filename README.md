# Quick start guide...

This is a use-package based emacs configuration adapted from https://github.com/ocodo/.emacs.d

You can add packages from Elpa, and customisations to `local/init.el`,
these will run after `init.el` has finished.

### Local Config

To add localised config, create and use the folder `./local/`

Add general config to `./local/init.el`

Customize will write to (and load from) `./local/custom.el` if you add
it before startup.

Copy `./custom/custom.el` to `./local/custom.el` if you want to start
from the same state as the general config.

# Package/Feature configuration

Feature/Package configuration is set in `/_configs` and enabled by
symlinking to `_activated`.

# Local Color Theme Persistence

You color-theme selection is always stored locally, in
~/.emacs-theme - initially this will be non-existent or empty.

After first running Emacs with this config, simply run:

    M-x helm-themes

Now select a theme from the list.

Your selection will be saved, and untouched by upstream.
