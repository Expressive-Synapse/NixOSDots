{ pkgs, ... }:
{
  home.packages = with pkgs; [
    waypaper
    awww
    hyprpaper
    mpvpaper
  ];

  home.persistence."/persist" = {
    directories = [
      ".config/waypaper"
    ];
  };
}
