# Project notes for agents

Deliberate decisions in this repo. Do not revert them without asking:

- `~/.zshrc`, `~/.zshenv` and `~/.gitconfig` are local stubs, not symlinks, so installers do not edit this repo. See `ensure_stub` in `lib/_bootstrap.sh`.
- `link/config/<app>/<file>` links single files, not directories, because apps keep sockets and logs next to their config.
- This repo is public. Never commit anything specific to one machine, host names, email addresses or credentials. Those belong in `~/.zshrc.local`, `~/.gitconfig` or `~/.agents-local/`.
- `macos/Brewfile` lists wanted packages. Do not add `brew bundle cleanup`: it uninstalls every package that is not listed.
- On Linux, neovim comes from `github:neovim/neovim-releases` because the official build needs glibc 2.32 or later.

## Maintaining this file

- Keep only notes that help almost every future session in this repo.
- Do not repeat what the code shows. Point to the file instead.
- Prefer rewriting or pruning entries over appending new ones.
