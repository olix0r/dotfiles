#!/bin/bash

set -eux

DOTFILE_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &>/dev/null && pwd )"

sudo apt install -y \
    gnupg2 \
    htop \
    jo \
    jq \
    less \
    locales \
    psmisc \
    ripgrep \
    vim \
    zsh

sudo sed -i 's/^# *\(en_US.UTF-8\)/\1/' /etc/locale.gen
sudo locale-gen

cp $DOTFILE_DIR/gitignore $HOME/.gitignore

curl --proto '=https' --tlsv1.3 -vfsSL https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | zsh
cp $DOTFILE_DIR/zshenv $HOME/zshenv
(
    if [ -d /workspaces ] && [ -n "$(ls /workspaces)" ]; then
        p=$(find /workspaces -mindepth 1 -maxdepth 1 -printf '%P' | cksum | cut -d ' ' -f 1)
    else
        p=$RANDOM
        g=$RANDOM
    fi
    echo
    echo "export PROMPT_PREFIX_COLOR=$((p % (231 - 124) + 124))"
) >>$HOME/.zshenv
cp $DOTFILE_DIR/zshrc $HOME/.zshrc

mkdir -p $HOME/bin
cp -rp $DOTFILE_DIR/bin/* $HOME/bin/

if command -v k3d >/dev/null 2>&1 ; then
    k3d kubeconfig merge -d 2>/dev/null || true
fi
