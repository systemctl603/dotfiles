#!/usr/bin/env bash

if [ ! -d ~/.dotfiles ]
then
    echo "Installing dotfiles..."
    git clone https://github.com/systemctl603/dotfiles.git ~/.dotfiles
fi

echo "Symlinking dotfiles"
stow -t ~ config

echo "Installing fonts"
fc-cache -fv
