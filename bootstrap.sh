#!/bin/bash

set -eu

DOTFILE_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &>/dev/null && pwd )"

sudo apt install -y htop less psmisc ripgrep vim zsh

mkdir -p $HOME/bin

curl -sL https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | zsh
cp $DOTFILE_DIR/.zshrc $HOME/.zshrc

cp $DOTFILE_DIR/.gitignore $HOME/.gitignore

cp -rp $DOTFILE_DIR/bin/* $HOME/bin/

k3d kubeconfig merge -d 2>/dev/null || true
