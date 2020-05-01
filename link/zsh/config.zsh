# ---------------
#       FZF
# ---------------

if [[ "$OSTYPE" =~ ^darwin ]]; then
  source /usr/local/opt/fzf/shell/completion.zsh
  source /usr/local/opt/fzf/shell/key-bindings.zsh
fi

export FZF_DEFAULT_OPTS="--no-mouse --height 40% --multi -1 --reverse --info=inline --preview='[[ \$(file --mime {}) =~ binary ]] && echo {} is a binary file || (bat --style=numbers --color=always {} || cat {}) 2> /dev/null | head -300' --preview-window='right:wrap:hidden' --bind='f3:execute(bat --style=numbers {} || less -f {}),f2:toggle-preview,ctrl-d:half-page-down,ctrl-u:half-page-up,ctrl-a:select-all+accept,ctrl-y:execute-silent(echo {+} | pbcopy)'"

FD_OPTIONS="--hidden --follow --exclude .git"
# Use git ls-files inside git repo, otherwise fd
export FZF_DEFAULT_COMMAND="git ls-files --cached --others --exclude-standard | fd --type f --type l $FD_OPTIONS"
export FZF_CTRL_T_COMMAND="fd $FD_OPTIONS"
export FZF_ALT_C_COMMAND="fd --type d $FD_OPTIONS"

_fzf_compgen_path() {
  fd "$FD_OPTIONS" . "$1"
}

_fzf_compgen_dir() {
  fd "$FD_OPTIONS" . "$1"
}

# preview commands that are too long
export FZF_CTRL_R_OPTS="--preview 'echo {}' --preview-window down:3:hidden:wrap --bind '?:toggle-preview'"

# preview content of file under the cursor
export FZF_CTRL_T_OPTS="--preview '(highlight -O ansi -l {} 2> /dev/null || cat {} || tree -C {}) 2> /dev/null | head -200'"
