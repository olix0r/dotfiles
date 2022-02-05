export ZSH=$HOME/.oh-my-zsh

plugins=(docker gitfast kubectl rust)
source $ZSH/oh-my-zsh.sh
#zstyle :omz:plugins:ssh-agent agent-forwarding on

autoload -U colors && colors

export PROMPT_PREFIX_COLOR=${PROMPT_PREFIX_COLOR:-$((RANDOM % 190 + 40))}
export PROMPT_GIT_COLOR=${PROMPT_GIT_COLOR:-$((RANDOM % 190 + 40))}
export ZSH_THEME_GIT_PROMPT_PREFIX="${FG[$PROMPT_GIT_COLOR]}$(git_repo_name)@"
export ZSH_THEME_GIT_PROMPT_DIRTY="${FG[133]}"
export ZSH_THEME_GIT_PROMPT_CLEAN="${FG[118]}"
export ZSH_THEME_GIT_PROMPT_SUFFIX=""
export PROMPT='%{$FG[$PROMPT_PREFIX_COLOR]%}#; %{$reset_color%}$(git_prompt_info)#$(git_prompt_short_sha)%{$reset_color%}
%{$FG[$PROMPT_PREFIX_COLOR]%}:;%{$reset_color%} '

bindkey -v
bindkey '^R' history-incremental-search-backward

cpwd() {
	cd $(pwd -P)
}
