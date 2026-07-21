{

  description = "my Primary flake";

  inputs = {

    nixpkgs = {
      url = "nixpkgs/nixos-unstable";
    };

   sops-nix = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    preservation.url = "github:nix-community/preservation";

    stylix = {
      url = "github:danth/stylix";
    };

    xremap-flake = {
      url = "github:xremap/nix-flake";
    };

    noctalia = {
      url = "github:noctalia-dev/noctalia";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprland = {
      url = "git+https://github.com/hyprwm/Hyprland?submodules=1";
    };

    hyprland-plugins = {
      url = "github:hyprwm/hyprland-plugins";
      inputs.hyprland.follows = "hyprland";
    };

    split-monitor-workspaces = {
      url = "github:Duckonaut/split-monitor-workspaces";
      inputs.hyprland.follows = "hyprland";
    };

    zen-browser = {
      url = "github:youwen5/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hytale-launcher = {
      url = "github:JPyke3/hytale-launcher-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    maccel = {
      url = "github:Gnarus-G/maccel";
    };

  };

  outputs =
    inputs@{
      self,
      nixpkgs,
      stylix,
     ...
    }:
    let
      lib = nixpkgs.lib;
      pkgs = nixpkgs.legacyPackages."x86_64-linux";
    in
    {
      nixosConfigurations = {
        "Titanic" = lib.nixosSystem {
          system = "x86_64-linux";
          modules = [
            inputs.disko.nixosModules.default
            inputs.preservation.nixosModules.default
            inputs.sops-nix.nixosModules.sops
            inputs.xremap-flake.nixosModules.default
            ./hosts/Titanic/configuration.nix
          ];
          specialArgs = {
            inherit inputs;
          };
        };
        "ServerBoy" = lib.nixosSystem {
          system = "x86_64-linux";
          modules = [
            inputs.disko.nixosModules.default
            inputs.sops-nix.nixosModules.sops
            inputs.xremap-flake.nixosModules.default
            ./hosts/ServerBoy/configuration.nix
          ];
          specialArgs = {
            inherit inputs;
          };
        };
      };
    };

}
