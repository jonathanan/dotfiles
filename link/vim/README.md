# `~/.vim`

Plugins:
* [Vundle] (https://github.com/VundleVim/Vundle.vim)
  * Plugin Manager
  * ```:help vundle```
* [Nerdtree] (https://github.com/scrooloose/nerdtree)
  * File tree explorer
  * ```:help nerdtree```
* [Nerdcommenter] (https://github.com/scrooloose/nerdcommenter)
  * Easier commenting
  * ```:help nerdcommenter```
* [Syntastic] (https://github.com/scrooloose/syntastic)
  * Syntax checking
  * ```:help syntastic```
* [vim-fugitive] (https://github.com/tpope/vim-fugitive)
  * git wrapper to manager your git actions from within Vim
  * ```:help fugitive```
* [vim-gitgutter] (https://github.com/airblade/vim-gitgutter)
  * git diff while editing
  * ```:help gitgutter```
* [ctrlp.vim] (https://github.com/ctrlpvim/ctrlp.vim)
  * full path fuzzy file, buffer, mur, tag, ... finder for Vim
  * ```:help ctrlp-options```
* [vim-better-whitespace] (https://github.com/ntpeters/vim-better-whitespace)
  * Highlight and delete trailing whitespaces
  * ```:help better-whitespace```
* [ag.vim] (https://github.com/rking/ag.vim)
  * Silver Searcher for vim
  * ```:help ag```
* [vim-sleuth] (https://github.com/tpope/vim-sleuth)
  * Automatically adjusts `'shiftwdith'` and `'expandtab'` based on current file
    or adjacent/parent files of the same type.
  * ```:help sleuth```
* [YouCompleteMe] (https://github.com/Valloric/YouCompleteMe)
  * A code-completion engine for Vim
  * ```:help ycm```

# Configure

Install plugins by cloning the repository under your home directory
```
git clone --recursive https://github.com/jonathanan/.vim.git ~/.vim
vim +PluginInstall +qall
```

Clean unused plugins
```
:PluginClean
```
