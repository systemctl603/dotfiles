#!/bin/bash
BASEDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

curl -L https://get.oh-my.fish | fish

ln -s ${BASEDIR}/emacs.d ~/.emacs.d
ln -s ${BASEDIR}/omf ~/.config/omf
