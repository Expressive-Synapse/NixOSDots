{ pkgs, ... }:

{
  home.packages = with pkgs; [
    bottles
    wineWowPackages.waylandFull
    winetricks
  ];

  home.persistence."/persist" = {
    directories = [
      ".local/share/bottles"
    ];
  };
}
