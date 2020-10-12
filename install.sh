#!/bin/bash
BASEDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

git clone https://github.com/ohmyzsh/ohmyzsh.git ~/.oh-my-zsh
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k


ln -s ${BASEDIR}/emacs.d ~/.emacs.d
ln -s ${BASEDIR}/zshrc ~/.zshrc
ln -s ${BASEDIR}/omf ~/.config/omf
