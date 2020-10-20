#!/usr/bin/env bash

while true
do
	read -p "This will overwrite files in ~. Are you sure you want to do this (Y/n)? " stowOrNot
	case $stowOrNot in
		Y | y ) break ;;
		n ) exit ;;
		* ) ;;
	esac
done


echo "Symlinking dotfiles"
stow npm
stow omf

if [ ! -d "~/.emacs.d" ] && [ ! -d "emacs/.emacs.d" ]
then
	echo "Installing doom..."

	git clone --depth 1 https://github.com/hlissner/doom-emacs ~/.emacs.d
	~/.emacs.d/bin/doom install

	rm -rf ~/.doom.d
	stow emacs
	~/.emacs.d/bin/doom sync
elif [ "~/.emacs.d" ] && [ ! -d "emacs/.emacs.d" ]
then
	 stow emacs
	~/.emacs.d/bin/doom sync
else
	stow emacs
fi

