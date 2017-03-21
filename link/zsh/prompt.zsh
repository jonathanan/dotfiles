RPS1='' # Disable vi-mode plugin setting

VIM_PROMPT=$PURE_PROMPT_SYMBOL
PROMPT='%(?.%F{magenta}.%F{red})${VIM_PROMPT}%f '

# Changes prompt symbol when in vi-mode
prompt_pure_update_vim_prompt() {
    zle || {
        print "error: pure_update_vim_prompt must be called when zle is active"
        return 1
    }
    VIM_PROMPT=${${KEYMAP/vicmd/<}/(main|viins)/$PURE_PROMPT_SYMBOL}
    zle .reset-prompt
}

function zle-line-init zle-keymap-select {
    prompt_pure_update_vim_prompt
}
zle -N zle-line-init
zle -N zle-keymap-select
