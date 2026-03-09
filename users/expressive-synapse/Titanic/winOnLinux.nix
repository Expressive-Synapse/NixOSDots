{ pkgs, ... }:

{
  home.packages = with pkgs; [
    bottles
    wineWow64Packages.waylandFull
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
