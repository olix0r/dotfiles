#compdef __just just

if (( $+commands[just] )); then
    just --completions=zsh > "$ZSH_CACHE_DIR/completions/_just"
fi

__just() {
    source "$ZSH_CACHE_DIR/completions/_just"
}
