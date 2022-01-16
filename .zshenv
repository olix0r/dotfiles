export HISTSIZE=100000
export SAVEHIST=100000
export HISTFILE=~/.zsh_history

export EDITOR=vim
export VISUAL=$EDITOR

export LC_TIME=C
export TZ=UTC
export LESSCHARSET=utf-8

if [ -f $HOME/.cargo/env ]; then
  source $HOME/.cargo/env
fi

export PATH="$HOME/bin:$PATH"


