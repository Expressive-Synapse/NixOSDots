{ pkgs, ... }:

{
  home.packages = with pkgs; [
    bottles
    wine-wayland
    winetricks
  ];

  home.persistence."/persist" = {
    directories = [
      ".local/share/bottles"
    ];
  };
}
