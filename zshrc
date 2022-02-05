export ZSH=$HOME/.oh-my-zsh

plugins=(docker gitfast kubectl rust)
source $ZSH/oh-my-zsh.sh
#zstyle :omz:plugins:ssh-agent agent-forwarding on

autoload -U colors && colors

export PROMPT_PREFIX_COLOR=${PROMPT_PREFIX_COLOR:-$((RANDOM % 190 + 40))}
export PROMPT_DIR_COLOR=${PROMPT_DIR_COLOR:-$((RANDOM % 190 + 40))}
export PROMPT_GIT_COLOR=${PROMPT_GIT_COLOR:-$((RANDOM % 190 + 40))}
export ZSH_THEME_GIT_PROMPT_PREFIX="${FG[$PROMPT_GIT_COLOR]}@"
export ZSH_THEME_GIT_PROMPT_DIRTY="${FG[133]}# ✘"
export ZSH_THEME_GIT_PROMPT_CLEAN="${FG[118]}#$(git_prompt_short_sha) ✔"
export ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
export ZSH_THEME_GIT_PROMPT_ADDED="${FG[082]}✚%{$reset_color%}"
export ZSH_THEME_GIT_PROMPT_MODIFIED="${FG[166]}✹%{$reset_color%}"
export ZSH_THEME_GIT_PROMPT_DELETED="${FG[160]}✖%{$reset_color%}"
export ZSH_THEME_GIT_PROMPT_RENAMED="${FG[220]}➜%{$reset_color%}"
export ZSH_THEME_GIT_PROMPT_UNMERGED="${FG[082]}═%{$reset_color%}"
export ZSH_THEME_GIT_PROMPT_UNTRACKED="${FG[190]}✭%{$reset_color%}"
export PROMPT='%{$FG[$PROMPT_PREFIX_COLOR]%}#; %{$FG[$PROMPT_DIR_COLOR]%}$(git_repo_name)%{$reset_color%}$(git_prompt_info)%{$reset_color%}
%{$FG[$PROMPT_PREFIX_COLOR]%}:;%{$reset_color%} '

bindkey -v
bindkey '^R' history-incremental-search-backward

cpwd() {
	cd $(pwd -P)
}
