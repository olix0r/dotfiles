if (( $+commands[linkerd] )); then
    linkerd completion zsh > "$ZSH_CACHE_DIR/completions/_linkerd"
    source "$ZSH_CACHE_DIR/completions/_linkerd"
fi
