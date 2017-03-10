# Zsh
alias zshconfig="vim ~/.zshrc"

# Git
alias g='git'
alias git-root='cd ./$(git rev-parse --show-cdup)'

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
