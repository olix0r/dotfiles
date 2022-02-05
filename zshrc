export ZSH=$HOME/.oh-my-zsh

plugins=(docker gitfast kubectl rust)
source $ZSH/oh-my-zsh.sh
#zstyle :omz:plugins:ssh-agent agent-forwarding on

autoload -U colors && colors

function git_prompt() {
	name=$(git_repo_name)
	if [ -n "$name" ]; then
		local info="$(git_prompt_info)"
	 	local g=$(echo "$info" | cksum | cut -d ' ' -f 1)
		echo "$name${FG[$((g % (231 - 124) + 124))]}${info}#$(git_prompt_short_sha)"
	fi
}

export PROMPT_PREFIX_COLOR=${PROMPT_PREFIX_COLOR:-$((RANDOM % 190 + 40))}
export ZSH_THEME_GIT_PROMPT_PREFIX="@"
export ZSH_THEME_GIT_PROMPT_DIRTY="${FG[133]}"
export ZSH_THEME_GIT_PROMPT_CLEAN="${FG[118]}"
export ZSH_THEME_GIT_PROMPT_SUFFIX=""
export PROMPT='%{$FG[$PROMPT_PREFIX_COLOR]%}#; $(git_prompt)%{$reset_color%}
%{$FG[$PROMPT_PREFIX_COLOR]%}:;%{$reset_color%} '

bindkey -v
bindkey '^R' history-incremental-search-backward

cpwd() {
	cd $(pwd -P)
}
