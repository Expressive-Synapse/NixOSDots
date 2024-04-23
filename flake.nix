{

  description = "my Primary flake";
  
  outputs = inputs@{ self, nixpkgs, home-manager, nixpkgs-stable, home-manager-stable, nixvim, stylix, ... }:
    let
      flakeSettings = {
        system = "x86_64-linux"; # system architecture
        hostname = "Titanic"; # system hostname
      };

      lib = nixpkgs.lib;
      pkgs = nixpkgs.legacyPackages.${flakeSettings.system};

      pkgs-stable = import nixpkgs-stable {
        system = flakeSettings.system;
      	config = {
	        allowUnfree = true;
	        allowUnfreePredicate = (_: true);
        };
      };
    in {
    nixosConfigurations = {
      ${flakeSettings.hostname} = lib.nixosSystem {
	      system = flakeSettings.system;
	      modules = [
	  inputs.sops-nix.nixosModules.sops
	  inputs.xremap-flake.nixosModules.default
          ./hosts/${flakeSettings.hostname}/configuration.nix 
        ];
      
        specialArgs = {
          inherit inputs;
          inherit flakeSettings;
        };
      };
    };

    homeConfigurations = {
      expressive-synapse = home-manager.lib.homeManagerConfiguration {
	inherit pkgs;
        modules = [
         ./users/expressive-synapse/home.nix
        ];

        extraSpecialArgs = {
          inherit inputs;
          inherit flakeSettings;
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

    stylix.url = "github:danth/stylix";

    nixvim.url = "github:nix-community/nixvim";
    nixvim.inputs.nixpkgs.follows = "nixpkgs";

    xremap-flake.url = "github:xremap/nix-flake";

    hyprland.url = "github:hyprwm/Hyprland";
    split-monitor-workspaces = {
      url = "github:Duckonaut/split-monitor-workspaces";
      inputs.hyprland.follows = "hyprland";
    };
    ags.url = "github:Aylur/ags";
  };

}
