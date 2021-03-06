export ZSH=$HOME/.oh-my-zsh

plugins=(docker gitfast just k3d kubectl linkerd rust)
source $ZSH/oh-my-zsh.sh
source $HOME/.prompt.zsh
#zstyle :omz:plugins:ssh-agent agent-forwarding on

bindkey -v
bindkey '^R' history-incremental-search-backward

cpwd() {
	cd $(pwd -P)
}
