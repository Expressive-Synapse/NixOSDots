{ inputs, pkgs, ... }:

{
  home.packages = [
    pkgs.prismlauncher
    pkgs.r2modman
    pkgs.scarab
    pkgs.olympus
    pkgs.vintagestory
    # inputs.hytale-launcher.packages.${pkgs.stdenv.hostPlatform.system}.default
  ];

}
