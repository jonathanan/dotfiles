alias ls='ls -G'

# Dotfiles
alias cd-dotfiles='cd ~/.dotfiles'

# [n]vim
if type nvim > /dev/null 2>&1; then
    alias vim='nvim'
fi

# Zsh
alias zshconfig='vim ~/.zshrc'
alias zshsource='source ~/.zshrc'

# Git
alias gitconfig='vim ~/.gitconfig'
alias g='git'
alias gr='cd ./$(git rev-parse --show-cdup)' # Go to root of git project

# Tmux
alias tn='tmux new-session -s'
alias ta='tmux attach -t'
alias tls='tmux ls'
alias tks='tmux kill-session -t'
alias tksa='tmux kill-server'

# Test Kitchen
alias klist='kitchen list'
alias klogin='kitchen login'
alias kcreate='kitchen create'
alias kdestroy='kitchen destroy'
alias kconverge='kitchen converge'
alias kverify='kitchen verify'
alias ktest='kitchen test'

# Ranger
alias r='ranger'

# Docker
alias d='docker'
alias docker-remove-exited-containers='docker rm $(docker ps -a -f status=exited -q)'

# Bat
bat_copy_to_clipboard() {
    bat $@
    if [[ "$*" == **-p** ]] || [[ "$*" == **--plain** ]]; then
        bat $@ | pbcopy
    fi
}
alias bat=bat_copy_to_clipboard

# Terraform
alias tf='terraform'
