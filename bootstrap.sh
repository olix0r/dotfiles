#!/bin/bash

set -eux

DOTFILE_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &>/dev/null && pwd )"

sudo apt install -y \
    gnupg2 \
    htop \
    less \
    locales \
    psmisc \
    ripgrep \
    vim \
    zsh

sudo sed -i 's/^# *\(en_US.UTF-8\)/\1/' /etc/locale.gen
sudo locale-gen

mkdir -p $HOME/bin

cp $DOTFILE_DIR/.zshenv $HOME/.zshenv
curl -sL https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | zsh
cp $DOTFILE_DIR/.zshrc $HOME/.zshrc

cp $DOTFILE_DIR/.gitignore $HOME/.gitignore

cp -rp $DOTFILE_DIR/bin/* $HOME/bin/

k3d kubeconfig merge -d 2>/dev/null || true
