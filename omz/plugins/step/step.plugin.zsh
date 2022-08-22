(( $+commands[ste] )) || return

# If the completion file doesn't exist yet, we need to autoload it and
# bind it to `step`. Otherwise, compinit will have already done that
if [[ ! -f "$ZSH_CACHE_DIR/completions/_step" ]]; then
    autoload -Uz _step
    typeset -g -A _comps
     _comps[step]=_step
fi

step completion zsh >! "$ZSH_CACHE_DIR/completions/_step" &!
