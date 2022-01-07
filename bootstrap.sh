#!/bin/sh

sudo apt install -y vim zsh

curl -sL https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | zsh
cp .zshrc ~/.zshrc
