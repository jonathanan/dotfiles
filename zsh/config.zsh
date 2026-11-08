# ---------------
#       FZF
# ---------------

if (( $+commands[fzf] )); then
  source <(fzf --zsh)

  fzf_preview="(bat --style=numbers --color=always {} || cat {}) 2> /dev/null | head -300"
  fzf_binds="f3:execute(bat --style=numbers {} || less -f {}),f2:toggle-preview,ctrl-d:half-page-down,ctrl-u:half-page-up,ctrl-a:select-all+accept"
  if [[ "$OSTYPE" == darwin* ]]; then
    fzf_binds+=",ctrl-y:execute-silent(echo {+} | pbcopy)"
  fi
  export FZF_DEFAULT_OPTS="--no-mouse --height 40% --multi -1 --reverse --info=inline --preview='[[ \$(file --mime {}) =~ binary ]] && echo {} is a binary file || $fzf_preview' --preview-window='right:wrap:hidden' --bind='$fzf_binds'"
  unset fzf_preview fzf_binds

  if (( $+commands[fd] )); then
    FD_OPTIONS="--hidden --follow --exclude .git"
    # Use git ls-files inside git repo, otherwise fd
    export FZF_DEFAULT_COMMAND="git ls-files --cached --others --exclude-standard 2> /dev/null || fd --type f --type l $FD_OPTIONS"
    export FZF_CTRL_T_COMMAND="fd $FD_OPTIONS"
    export FZF_ALT_C_COMMAND="fd --type d $FD_OPTIONS"

    _fzf_compgen_path() {
      fd ${=FD_OPTIONS} . "$1"
    }

    _fzf_compgen_dir() {
      fd --type d ${=FD_OPTIONS} . "$1"
    }
  fi

  # preview commands that are too long
  export FZF_CTRL_R_OPTS="--preview 'echo {}' --preview-window down:3:hidden:wrap --bind '?:toggle-preview'"

  # preview content of file under the cursor
  export FZF_CTRL_T_OPTS="--preview '(bat --style=numbers --color=always {} || cat {} || tree -C {}) 2> /dev/null | head -200'"
fi

# ---------------
#      ZSH
# ---------------

# gh cli tool completion
if (( $+commands[gh] )); then
  eval "$(gh completion -s zsh)"
fi
