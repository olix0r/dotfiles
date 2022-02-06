export ZSH=$HOME/.oh-my-zsh

plugins=(docker gitfast kubectl rust)
source $ZSH/oh-my-zsh.sh
#zstyle :omz:plugins:ssh-agent agent-forwarding on

autoload -U colors && colors

export ZSH_THEME_GIT_PROMPT_PREFIX=""
export ZSH_THEME_GIT_PROMPT_CLEAN=""
export ZSH_THEME_GIT_PROMPT_DIRTY=""
export ZSH_THEME_GIT_PROMPT_SUFFIX=""
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
		local ref="$(git symbolic-ref HEAD)"
		local info=""
		if [ "${ref##refs/heads/}" != "main" ] && [ "${ref##refs/heads/}" != "master" ]; then
			info="${FG[$(_color_per "$ref")]}@$(git_prompt_info)"
		fi
		local sfx=""
		if [ -z "$(git status --porcelain 2>/dev/null)" ]; then
			sfx="${FG[118]}#$(git_prompt_short_sha) ✔"
		else
			sfx="${FG[133]}#$(git_prompt_short_sha) ✘"
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
