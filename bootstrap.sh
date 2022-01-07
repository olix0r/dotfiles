#!/bin/sh

sudo apt install -y vim zsh

# TODO oh my zsh
# TODO install zshrc

env > ~/.configured

sudo chsh -s /usr/bin/zsh $(whoami)

# export EDITOR=vim
# export VISUAL=$EDITOR
