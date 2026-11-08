if [[ "$OSTYPE" == darwin* ]]; then
  alias ls='ls -G'
else
  alias ls='ls --color=auto'
fi

# Dotfiles
alias cd-dotfiles='cd $DOTFILES'

# Editor
if (( $+commands[nvim] )); then
  alias vi='nvim'
  alias vim='nvim'
fi

# Zsh
alias zshconfig='$EDITOR $DOTFILES/zsh/zshrc'
alias zshsource='source ~/.zshrc'

# Git
alias gitconfig='$EDITOR $DOTFILES/git/gitconfig'
alias g='git'
alias gr='cd ./$(git rev-parse --show-cdup)' # Go to root of git project

# Tmux
if (( $+commands[tmux] )); then
  alias tn='tmux new-session -s'
  alias ta='tmux attach -t'
  alias td='tmux detach'
  alias tls='tmux ls'
  alias tks='tmux kill-session -t'
  alias tksa='tmux kill-server'
fi

# Docker
alias d='docker'
alias docker-remove-exited-containers='docker rm $(docker ps -a -f status=exited -q)'

# Bat: also copy to the clipboard with -p/--plain on macOS
if [[ "$OSTYPE" == darwin* ]] && (( $+commands[bat] )); then
  bat_copy_to_clipboard() {
    command bat "$@"
    if [[ "$*" == *-p* ]] || [[ "$*" == *--plain* ]]; then
      command bat "$@" | pbcopy
    fi
  }
  alias bat=bat_copy_to_clipboard
fi
