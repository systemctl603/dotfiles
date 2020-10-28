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

if [ ! -d ~/.config/emacs ] && [ ! -d emacs/.config/emacs ]
then
	echo "Installing doom..."

	git clone --depth 1 https://github.com/hlissner/doom-emacs ~/.config/emacs
	rm -rf ~/.doom.d
	stow -t ~ emacs
	~/.config/emacs/bin/doom sync
	~/.config/emacs/bin/doom env
elif [ -d ~/.config/emacs ] && [ ! -d emacs/.config/emacs ]
then
	 stow -t ~ emacs
	~/.config/emacs/bin/doom sync
else
	stow -t ~ emacs
fi

