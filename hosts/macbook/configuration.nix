{ config, pkgs, ... }:
{
  system.stateVersion = 6;
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nixpkgs.hostPlatform = "aarch64-darwin";
  nixpkgs.config = {
    allowUnfree = true;
    allowBroken = true;
  };

  environment.systemPackages = with pkgs; [
    neovim
    ripgrep

    # Python
    python3
    uv

    # Go
    go

    # JVM language
    kotlin
    clojure

    # Apps
    slack
    raycast
  ];

  users.users.pexea12 = {
    name = "pexea12";
    home = "/Users/pexea12";
  };

  system.defaults.dock.autohide = true;
}
