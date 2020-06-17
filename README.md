# rsvd-user
This simple configuration auto-starts a daemon supervisor (`runsvdir`) the first time a user logs in.
The service `logmon`, that will always be enabled for all users, monitors whether the user has logged off, and if so
stops the daemon supervisor. To start the supervisor, the file `/etc/profile` must be sourced after login.

Services built as defined in [`runsvdir(8)`](http://smarden.org/runit/runsvdir.8.html) must be linked to `$HOME/.config/sv/`
to be enabled. Then, [`sv(8)`](http://smarden.org/runit/sv.8.html) can be used to manage said services.

The main purpose of this configuration is to allow setting up daemons for desktop sessions started with `lightdm`,
as `lightdm` itself does not clean up the programs executing in background that have been started through `.xprofile` or similar.

## Installation
Simply copy the contents of the `etc/` directory to your machine's `/etc/`. The configuration should start in the next login.
