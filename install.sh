#!/usr/bin/env bash

if [ ! -d ~/.dotfiles ]
then
    echo "Installing dotfiles..."
    git clone https://github.com/systemctl603/dotfiles.git ~/.dotfiles
fi

while true
do
    echo "This will overwrite files in ~. Are you sure you want to do this (Y/n)? "	 
    read stowOrNot
    case $stowOrNot in
				Y | y ) break ;;
				n ) exit ;;
				* ) ;;
    esac
done


echo "Symlinking dotfiles"
stow -t ~ npm
stow -t ~ omf
stow -t ~ binaries
stow -t ~ emacs
stow -t ~ zsh

