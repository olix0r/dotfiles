#!/bin/bash

DOTFILE_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &>/dev/null && pwd )"

sudo apt install -y htop less psmisc vim zsh

mkdir -p $HOME/bin

curl -sL https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | zsh
cp $DOTFILE_DIR/.zshrc $HOME/.zshrc

cp $DOTFILE_DIR/.gitignore $HOME/.gitignore

cp -rp $DOTFILE_DIR/bin/* $HOME/bin/
