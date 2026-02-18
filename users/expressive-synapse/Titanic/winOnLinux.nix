{ pkgs, ... }:

{
  home.packages = with pkgs; [
    bottles
    wine-wayland
  ];

  home.persistence."/persist" = {
    directories = [
      ".local/share/bottles"
    ];
  };
}
