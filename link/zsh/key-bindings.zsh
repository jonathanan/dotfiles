# Make sure that the terminal is in application mode when zle is active, since
# only then values from $terminfo are valid
if (( ${+terminfo[smkx]} )) && (( ${+terminfo[rmkx]} )); then
  function zle-line-init() {
    echoti smkx
  }
  function zle-line-finish() {
    echoti rmkx
  }
  zle -N zle-line-init
  zle -N zle-line-finish
fi

# [Shift-Tab] - move through the completion menu backwards
if [[ "${terminfo[kcbt]}" != "" ]]; then
  bindkey "${terminfo[kcbt]}" reverse-menu-complete
fi

# Alt + left/right = move backward/forward a word
bindkey -M viins "^[b" backward-word
bindkey -M viins "^[f" forward-word

# Cmd + left/right = move begin/end of line
bindkey -M viins "^[[1~" beginning-of-line
bindkey -M viins "^[[4~" end-of-line
