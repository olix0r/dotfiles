(( $+commands[pulumi] )) || return

# If the completion file doesn't exist yet, we need to autoload it and
# bind it to `pulumi`. Otherwise, compinit will have already done that
if [[ ! -f "$ZSH_CACHE_DIR/completions/_pulumi" ]]; then
    autoload -Uz _pulumi
    typeset -g -A _comps
     _comps[pulumi]=_pulumi
fi

pulumi completion zsh >! "$ZSH_CACHE_DIR/completions/_pulumi" &!
