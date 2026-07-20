{
  description = "a sad attempt as making a wrapped pacakge";

  inputs.wrappers.url = "github:BirdeeHub/nix-wrapper-modules";
  inputs.wrappers.inputs.follow = "nixpkgs";
  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

  ouputs =
    {
      self,
      nixpkgs,
      wrappers,
    }:
    let
      forAllSystems = with nixpkgs.lib; genAttrs platforms.all;
    in
    {
      packages = forAllSystems (system: {
        default = wrappers.wrappers.helix.wrap (
          {
            config,
            wlib,
            lib,
            pkgs,
            ...
          }:
          {
            pkgs = import nixpkgs { inherit system; };

            languages.language = [
              {
                name = "nix";
                auto-format = true;
                formatter.command = lib.getExe pkgs.nixfmt;
              }
            ];
          }
        );
      });
    };
}
