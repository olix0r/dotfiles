#compdef just

if (( $+commands[just] )); then
    just --completions=zsh > "$ZSH_CACHE_DIR/completions/_just"
    source "$ZSH_CACHE_DIR/completions/_just"
fi
