#!/bin/sh

sudo apt install -y vim zsh

# TODO oh my zsh
# TODO install zshrc

env > ~/.configured

#sudo chsh -s /usr/bin/zsh $(whoami)
curl -sL https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | zsh

# export EDITOR=vim
# export VISUAL=$EDITOR
