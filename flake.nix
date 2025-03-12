{
  description = "pexea12 nix system flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin = {
      url = "github:LnL7/nix-darwin/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{ self, nix-darwin, home-manager, nixpkgs }:
  let
    systems = {
      linux = "x86_64-linux";
      macbook = "aarch64-darwin";
    };
  in
  {
    # nix-darwin configuration (Macbook host)
    # $ darwin-rebuild build --flake .#macbook
    darwinConfigurations.macbook = nix-darwin.lib.darwinSystem {
      system = systems.macbook;
      modules = [
        ./hosts/macbook/configuration.nix
        home-manager.darwinModules.home-manager {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.pexea12 = import ./hosts/macbook/home.nix;
        }
      ];
    };
  };
}
