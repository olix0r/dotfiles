(( $+commands[linkerd] )) || return

# If the completion file doesn't exist yet, we need to autoload it and
# bind it to `linkerd`. Otherwise, compinit will have already done that
if [[ ! -f "$ZSH_CACHE_DIR/completions/_linkerd" ]]; then
    autoload -Uz _linkerd
    typeset -g -A _comps
     _comps[linkerd]=_linkerd
fi

linkerd completion zsh >! "$ZSH_CACHE_DIR/completions/_linkerd" &!
