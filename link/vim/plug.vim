" ----------------------------------------------------------------------------
"  Plug
" ----------------------------------------------------------------------------

" Basic Usage:
" :PlugInstall, :PlugUpdate, :PlugClean, :PlugStatus

" Install vim-plug if we don't already have it
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
      \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Indentation indictates dependency to plugin above
call plug#begin('~/.vim/plugged')
Plug 'preservim/nerdtree', {'on': 'NERDTreeToggle'}              " File tree explorer
  Plug 'Xuyuanp/nerdtree-git-plugin', {'on': 'NERDTreeToggle'}   " with Git status flags
  Plug 'tiagofumo/vim-nerdtree-syntax-highlight'                 " with syntax
Plug 'preservim/nerdcommenter'                                   " Easier commenting
Plug 'dense-analysis/ale'                                        " Syntax Checker, Fix files, LSP support
Plug 'neomake/neomake'                                           " Asyc run programs/Syntax Checker
Plug 'tpope/vim-fugitive'                                        " Git from within Vim
Plug 'airblade/vim-gitgutter'                                    " Git status on lines
Plug 'ctrlpvim/ctrlp.vim'                                        " Fuzzy searching
Plug 'ntpeters/vim-better-whitespace'                            " Handle trailing whitespaces
Plug 'rking/ag.vim'                                              " Silver searcher in Vim
Plug 'tpope/vim-sleuth'                                          " Auto adjust `shiftwidth` and `expandtab`
Plug 'ervandew/supertab'                                         " Perform insert mode completions with Tab
Plug 'Valloric/YouCompleteMe', {'on': [], 'do': './install.py'}  " Code-completion engine
  Plug 'SirVer/ultisnips', {'on': [] }                           " Code snippets
  Plug 'honza/vim-snippets', {'on': [] }                         " Code snippets
Plug 'jasonwhite/vim-whitenight'                                 " Colorscheme
Plug 'tpope/vim-obsession'                                       " Continuously updated session files
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } } " Preview markdown files
Plug 'tpope/vim-surround'                                        " Quoting/parenthesizing made simple
Plug 'tpope/vim-repeat'                                          " Remap . in way that plugins can tap into
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }               " Golang development features
Plug 'hashivim/vim-terraform'                                    " Terraform integration
Plug 'juliosueiras/vim-terraform-completion'                     " Terraform Completion
Plug 'ryanoasis/vim-devicons'                                    " File type icons
call plug#end()

augroup load_us_ycm                                              " Load plugins on enter insert mode
  autocmd!
  autocmd InsertEnter * call plug#load('YouCompleteMe', 'ultisnips', 'vim-snippets')
                      \| autocmd! load_us_ycm
augroup END
