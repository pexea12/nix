# My Nix configuration

Used for both Linux and MacOS.

### Dependencies
- [home-manager](https://nix-community.github.io/home-manager/)
- [nix-darwin](https://nix-community.github.io/home-manager/): For MacOS

### MacOS

Apply config:
```sh
darwin-rebuild switch --flake ".#macbook"
```


