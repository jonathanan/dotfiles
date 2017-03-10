# Check if zplug is installed
if [[ ! -d ~/.zplug ]]; then
  curl -sL zplug.sh/installer | zsh
fi

zplug 'zplug/zplug', hook-build:'zplug --self-manage'

zplug 'jonathanan/pure', as:theme
zplug 'ssh-agent', from:oh-my-zsh
zplug 'zsh-users/zsh-autosuggestions'
zplug 'zsh-users/zsh-completions'
zplug 'zsh-users/zsh-syntax-highlighting', defer:2

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

# Then, source plugins and add commands to $PATH
zplug load --verbose
