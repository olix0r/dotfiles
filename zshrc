export ZSH=$HOME/.oh-my-zsh

plugins=(docker gitfast kubectl rust)
source $ZSH/oh-my-zsh.sh
#zstyle :omz:plugins:ssh-agent agent-forwarding on

autoload -U colors && colors

function _color_per() {
	local n=$(echo "$1" | cksum | cut -d ' ' -f 1)
	echo "$((n % (231 - 124) + 124))"
}
function _prompt_color() {
	local name=$(git_repo_name)
	if [[ -n $name ]]; then
		_color_per "${name}"
	else
		_color_per "$PWD"
	fi
}
function _git_prompt() {
	local name="$(git_repo_name)"
	if [ -n "$name" ]; then
		export ZSH_THEME_GIT_PROMPT_PREFIX=""
		export ZSH_THEME_GIT_PROMPT_CLEAN=""
		export ZSH_THEME_GIT_PROMPT_DIRTY=""
		export ZSH_THEME_GIT_PROMPT_SUFFIX=""
		local ref="$(git symbolic-ref HEAD)"
		local info="${FG[$(_color_per "$ref")]}@$(git_prompt_info)"
		local sfx=""
		local sha="$(git_prompt_short_sha)"
		local sfx="${FG[$(_color_per "$sha")]}#${sha}"
		if [ -n "$(git status --porcelain 2>/dev/null)" ]; then
			sfx="${sfx} ✘"
		fi
		echo "${name}${info}${sfx}"
	fi
}
export PROMPT='%{$FG[$(_prompt_color)]%}#; $(_git_prompt)%{$reset_color%}
%{$FG[$(_prompt_color)]%}:;%{$reset_color%} '

bindkey -v
bindkey '^R' history-incremental-search-backward

cpwd() {
	cd $(pwd -P)
}
