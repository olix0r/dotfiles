if (( $+commands[k3d] )); then
    k3d completion zsh > "$ZSH_CACHE_DIR/completions/_k3d"
    source "$ZSH_CACHE_DIR/completions/_k3d"
fi
