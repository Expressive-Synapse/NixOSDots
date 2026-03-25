{ inputs, pkgs, ... }:

{
  home.packages = [
    pkgs.prismlauncher
    pkgs.r2modman
    pkgs.scarab
    pkgs.olympus
    inputs.hytale-launcher.packages.${pkgs.system}.default
  ];

  home.persistence."/persist" = {
    directories = [
      # ".steam"
      ".local/share/Steam"
      ".local/share/PrismLauncher"
      ".config/retroarch"
      "Zomboid"
    ];
  };
}
