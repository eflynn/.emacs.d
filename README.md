GNU Emacs configuration
=======================

![Emacs screenshot](/docs/screenshot.png "Emacs screenshot")

Features
--------

* Requires Emacs 24.
* `init.el` serves as a bootstrap for `init.d`. All files in that
  directory are loaded on startup.
* Packages are installed automatically on first startup.
* The default theme is wheatgrass, a nice white text on black background.
* Reference cards and notes are in `docs`.

Installation
------------

If `~/.emacs.d` already exists, rename it or delete it.

In the home directory, run

    git clone https://github.com/eflynn/.emacs.d

When you start Emacs, the required packages will be fetched from
Marmalade. This is necessary only on the first run.

Happy Emacs hacking!

Scripts in bin
--------------

* `e` starts emacsclient in a terminal.
* `eg` creates a new frame on the X server.

Copy these to `~/bin` for convenience.
