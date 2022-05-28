(( $+commands[k3d] ))|| return

# If the completion file doesn't exist yet, we need to autoload it and
# bind it to `k3d`. Otherwise, compinit will have already done that
if [[ ! -f "$ZSH_CACHE_DIR/completions/_k3d" ]]; then
    autoload -Uz _k3d
    typeset -g -A _comps
     _comps[k3d]=_k3d
fi

k3d completion zsh > "$ZSH_CACHE_DIR/completions/_k3d" &!
