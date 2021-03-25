# Dotfiles

Dotfiles that I use, along with an `install.sh` script to set up an environment automatically.

## Installation

For a oneline install, Run this: \
`curl "https://raw.githubusercontent.com/systemctl603/dotfiles/master/install.sh" | bash`

To install manually:

- Clone the repo to ~/.dotfiles
- Run `install.sh`

## Notes

Stow is needed to run the install script.

`pkglist.txt` contains packages which I use. \
`pkglist_required.txt` contains packages necessary for the dotfiles.

Both contain packages from the AUR, so make sure to install them like: \
`pikaur -S $(cat pkglist.txt)` \
where `pikaur` should be replaced with your AUR helper.
