{
  inputs,
  config,
  pkgs,
  ...
}:

let
  theme = "/Catppuccin Mocha.yaml";
in
{

  imports = [
    inputs.stylix.nixosModules.stylix
  ];

  # gtk.gtk4.theme = config.gtk.theme;

  stylix.enable = true;

  stylix.base16Scheme = ./themes + theme;

  stylix.cursor = {
    package = pkgs.catppuccin-cursors.mochaDark;
    name = "catppuccin-mocha-dark-cursors";
    size = 24;
  };

  stylix.fonts = {

    serif = {
      package = pkgs.dejavu_fonts;
      name = "DejaVu Serif";
    };

    sansSerif = {
      package = pkgs.dejavu_fonts;
      name = "DejaVu Sans";
    };

    monospace = {
      package = pkgs.nerd-fonts.inconsolata;
      name = "Inconsolata";
    };

    emoji = {
      package = pkgs.noto-fonts-color-emoji;
      name = "Noto Color Emoji";
    };

  };

  stylix.opacity = {
    terminal = 0.7;
    popups = 0.7;
  };
}
