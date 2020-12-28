#!/usr/bin/env bash

if [ ! -d ~/.dotfiles ]
then
    echo "Installing dotfiles..."
    git clone https://github.com/systemctl603/dotfiles.git ~/.dotfiles
fi



echo "This will overwrite files in ~. Are you sure you want to do this (Y/n)? "	 
read stowOrNot
case $stowOrNot in
	Y | y ) ;;
	n | *) exit ;;
esac



echo "Symlinking dotfiles"
stow -t ~ npm
stow -t ~ zsh
stow -t ~ polybar
stow -t ~ nixpkgs
stow -t ~ sxhkd
stow -t ~ bspwm

echo "Installing fonts"
stow -t ~ fonts

echo "Would you like to install nixos configuration.nix too?"
read nixosConf
case $nixosConf in
    Y | y ) ;;
    n | *) exit ;;
esac

sudo stow -t / nixos
