# `~/.*`

This repository allows me to quickly bootstrap and sync my machines with my
tools and configurations.

## Project Structure
```
bin/            Useful scripts

copy/           Dotfiles that should be copied instead of symlinked on initial bootstrap.

init/           OS specific bootstrap script to install packages.

lib/            Library used in bootstrapping script.

link/           Dotfiles that should be symlinked under the user's home directory.

vendor/         Git submodules location to be referenced.

bootstrap.sh    Initial bootstrapping script.
```
