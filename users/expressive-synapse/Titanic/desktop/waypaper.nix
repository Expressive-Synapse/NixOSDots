{ pkgs, ... }:
{
  home.packages = with pkgs; [
    waypaper
    awww
    hyprpaper
    mpvpaper
  ];

}
