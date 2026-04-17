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

  home.persistence."/persist" = {
    directories = [
      # ".steam"
      ".local/share/Steam"
      ".local/share/PrismLauncher"
      ".local/share/Hytale"
      ".local/share/hytale-launcher"
      ".config/retroarch"
      ".config/VintagestoryData"
      "Zomboid"
    ];
  };
}
