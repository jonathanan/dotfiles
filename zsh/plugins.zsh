# Load zsh plugins with antidote from a cached static file.
# bootstrap.sh clones antidote. The static file is rebuilt when plugins.txt changes.

antidote_dir=${ANTIDOTE_DIR:-$HOME/.antidote}
zsh_plugins_txt=$DOTFILES/zsh/plugins.txt
zsh_plugins_zsh=${XDG_CACHE_HOME:-$HOME/.cache}/zsh/plugins.zsh

if [[ ! -r $antidote_dir/antidote.zsh ]]; then
  print -u2 "dotfiles: antidote not found in $antidote_dir. Run $DOTFILES/bootstrap.sh."
elif [[ ! $zsh_plugins_zsh -nt $zsh_plugins_txt ]]; then
  mkdir -p "${zsh_plugins_zsh:h}"
  (
    source "$antidote_dir/antidote.zsh"
    antidote bundle <"$zsh_plugins_txt" >|"$zsh_plugins_zsh"
  )
fi

[[ -r $zsh_plugins_zsh ]] && source "$zsh_plugins_zsh"
unset antidote_dir zsh_plugins_txt zsh_plugins_zsh
