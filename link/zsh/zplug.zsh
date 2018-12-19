# Check if zplug is installed
if [[ ! -d ~/.zplug ]]; then
  curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh
fi

source ~/.zplug/init.zsh

# Indentation indictates dependency to plugin above
zplug 'zplug/zplug', hook-build:'zplug --self-manage'
zplug 'jonathanan/pure'
  zplug 'mafredri/zsh-async'
zplug 'lib/clipboard', from:oh-my-zsh
zplug 'lib/completion', from:oh-my-zsh
zplug 'lib/directories', from:oh-my-zsh
zplug 'lib/history', from:oh-my-zsh
zplug 'plugins/ssh-agent', from:oh-my-zsh
zplug 'plugins/vi-mode', from:oh-my-zsh
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

zplug load
