{ pkgs, ... }:

{
  home.packages = with pkgs; [
    bottles
    wineWow64Packages.waylandFull
    lutris
    winetricks
  ];

}
