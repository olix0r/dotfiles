(( $+commands[just] )) || return

# If the completion file doesn't exist yet, we need to autoload it and
# bind it to `just`. Otherwise, compinit will have already done that
if [[ ! -f "$ZSH_CACHE_DIR/completions/_just" ]]; then
    autoload -Uz _just
    typeset -g -A _comps
     _comps[just]=_just
fi

just --completions=zsh >! "$ZSH_CACHE_DIR/completions/_just" &!
