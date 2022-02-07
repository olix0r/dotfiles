autoload -U colors && colors

function _color_per() {
    local n=$(echo "$1" | cksum | cut -d ' ' -f 1)
    printf '%03d' "$((n % (15 - 9) + 9))"
}

function _prompt_color() {
    local name=$(git_repo_name)
    if [[ -n $name ]]; then
        _color_per "${name}"
    else
        _color_per "$PWD"
    fi
}

function _git_status_suffix() {
    local stat="$(git status --porcelain=v2 --branch 2>/dev/null)"
    local statfiles="$(echo "$stat" | grep -v '^# ')"
    if [ -n "$statfiles" ]; then
        echo -n " ${FG[$(_color_per "$statfiles")]}✱"
    fi

    local ab="$(echo "$stat" | sed -n 's/^# branch\.ab //p')"
    if [ -z "$ab" ]; then
        echo " ↥"
    else
        local up="${ab%% *}"
        local dn="${ab##* }"
        local color="${FG[$(_color_per "$ab")]}"
        if [ "$up" != "+0" ] && [ "$dn" = "-0" ]; then
            echo " ${color}↑"
        elif [ "$up" = "+0" ] && [ "$dn" != "-0" ]; then
            echo " ${color}↓"
        elif [ "$up" != "+0" ] && [ "$dn" != "-0" ]; then
            echo " ${color}⇅"
        else
            echo
        fi
    fi
}

function _git_prompt() {
    local name="$(git_repo_name)"
    if [ -n "$name" ]; then
        export ZSH_THEME_GIT_PROMPT_PREFIX=""
        export ZSH_THEME_GIT_PROMPT_CLEAN=""
        export ZSH_THEME_GIT_PROMPT_DIRTY=""
        export ZSH_THEME_GIT_PROMPT_SUFFIX=""
        local symbolic="$(git symbolic-ref HEAD 2>/dev/null || git_prompt_info)"
        local info="${FG[$(_color_per "$symbolic")]}@$(git_prompt_info)"
        local sha="$(git_prompt_short_sha)"
        local ref="${FG[$(_color_per "$sha")]}#${sha}"
        local sfx="$(_git_status_suffix)"
        echo "${name}${info}${ref}${sfx}"
    fi
}

export PROMPT='%{$FG[$(_prompt_color)]%}#; $(_git_prompt)%{$reset_color%}
%{$FG[$(_prompt_color)]%}:;%{$reset_color%} '
