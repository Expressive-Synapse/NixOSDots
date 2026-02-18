{ pkgs, ... }:

{
  home.packages = with pkgs; [
    bottles
    wineWowPackages.waylandFull
    lutris
    winetricks
  ];

  home.persistence."/persist" = {
    directories = [
      ".local/share/bottles"
      ".local/share/lutris"
    ];
  };
}
