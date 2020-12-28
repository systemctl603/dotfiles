{ pkgs, ... }:

{
  programs.neovim = {
    enable = true;
    package = pkgs.neovim-nightly;
  };
  programs.alacritty = {
    enable = true;
  };
}
