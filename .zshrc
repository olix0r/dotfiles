export ZSH=$HOME/.oh-my-zsh

plugins=(docker gitfast kubectl rust)
source $ZSH/oh-my-zsh.sh
#zstyle :omz:plugins:ssh-agent agent-forwarding on

autoload -U colors && colors

export ZSH_THEME_GIT_PROMPT_PREFIX=" ${FG[012]}("
export ZSH_THEME_GIT_PROMPT_SUFFIX="${FG[012]})%{$reset_color%}"
export ZSH_THEME_GIT_PROMPT_DIRTY=" ${FG[133]}✘"
export ZSH_THEME_GIT_PROMPT_CLEAN=" ${FG[118]}✔"
export ZSH_THEME_GIT_PROMPT_ADDED="${FG[082]}✚%{$reset_color%}"
export ZSH_THEME_GIT_PROMPT_MODIFIED="${FG[166]}✹%{$reset_color%}"
export ZSH_THEME_GIT_PROMPT_DELETED="${FG[160]}✖%{$reset_color%}"
export ZSH_THEME_GIT_PROMPT_RENAMED="${FG[220]}➜%{$reset_color%}"
export ZSH_THEME_GIT_PROMPT_UNMERGED="${FG[082]}═%{$reset_color%}"
export ZSH_THEME_GIT_PROMPT_UNTRACKED="${FG[190]}✭%{$reset_color%}"
export PROMPT='%{$FG[123]%}#; %{$FG[122]%}%~%{$reset_color%} %{$GIT_PROMPT_INFO%}$(git_prompt_info)
%{$reset_color%}%{$FG[123]%}:;%{$reset_color%} '

bindkey -v
bindkey '^R' history-incremental-search-backward

cpwd() {
	cd $(pwd -P)
}
