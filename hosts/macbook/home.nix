{ config, pkgs, ... }:
{
  home.stateVersion = "24.11";

  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  programs.home-manager.enable = true;

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    prezto = {
      enable = true;
      prompt.theme = "steeef";
    };
  };

  programs.tmux = {
    enable = true;
  };

  programs.git.enable = true;
}
