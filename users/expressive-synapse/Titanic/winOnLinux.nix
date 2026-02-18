{ pkgs, ... }:

{
  home.packages = with pkgs; [
    bottles
    wineWowPackages.stable
    wineWowPackages.waylandFull
    winetricks
  ];

  home.persistence."/persist" = {
    directories = [
      ".local/share/bottles"
    ];
  };
}
