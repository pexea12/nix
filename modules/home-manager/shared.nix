{ config, pkgs, ... }:
{
  home.stateVersion = "24.11";

  home.packages = with pkgs; [
    neovim
    ripgrep
    git
  ];


  programs.zsh.enable = true;
  programs.zsh.initExtra = ''
    export EDITOR=nvim
  '';
}
