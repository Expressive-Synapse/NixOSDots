{

  description = "my Primary flake";
  
  outputs = inputs@{ self, nixpkgs, nixpkgs-stable, stylix, ... }:
    let
      lib = nixpkgs.lib;
      pkgs = nixpkgs.legacyPackages."x86_64-linux";

      pkgs-stable = import nixpkgs-stable {
        system = "x86_64-linux";
      	config = {
	        allowUnfree = true;
	        allowUnfreePredicate = (_: true);
        };
      };
    in {
    nixosConfigurations = {
      "Titanic" = lib.nixosSystem {
	      system = "x86_64-linux";
	      modules = [
    inputs.home-manager.nixosModules.home-manager
    inputs.disko.nixosModules.default
    inputs.impermanence.nixosModules.impermanence
	  inputs.sops-nix.nixosModules.sops
	  inputs.xremap-flake.nixosModules.default
          ./hosts/Titanic/configuration.nix 
        ];
      
        specialArgs = {
          inherit inputs;
        };
      };
    };
  };

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "nixpkgs/nixos-23.11";

    home-manager.url = "github:nix-community/home-manager/master";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    home-manager-stable.url = "github:nix-community/home-manager/release-23.11";
    home-manager-stable.inputs.nixpkgs.follows = "nixpkgs-stable";

    sops-nix.url = "github:Mic92/sops-nix";
    sops-nix.inputs.nixpkgs.follows = "nixpkgs";

    disko.url = "github:nix-community/disko";
    disko.inputs.nixpkgs.follows = "nixpkgs";

    impermanence.url = "github:nix-community/impermanence";

    stylix.url = "github:danth/stylix";

    nixvim.url = "github:nix-community/nixvim";
    nixvim.inputs.nixpkgs.follows = "nixpkgs";

    xremap-flake.url = "github:xremap/nix-flake";

    hyprland.url = "git+https://github.com/hyprwm/Hyprland?submodules=1";
    split-monitor-workspaces = {
      url = "github:Duckonaut/split-monitor-workspaces";
      inputs.hyprland.follows = "hyprland";
    };
    ags.url = "github:Aylur/ags";
  };

}
