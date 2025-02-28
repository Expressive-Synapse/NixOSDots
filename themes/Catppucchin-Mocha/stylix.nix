{ inputs, pkgs, ... }:

let
  base16 = "/base16.yaml";
  wallpaperUrl = builtins.readFile (./. + "/wallpaperurl.txt");
  wallpaperSha256 = builtins.readFile (./. + "/wallpapersha256.txt");
in
{

imports = [
  inputs.stylix.homeManagerModules.stylix
  ];

stylix.enable = true;

stylix.image = pkgs.fetchurl {
  url = wallpaperUrl;
  sha256 = wallpaperSha256;
  };

stylix.base16Scheme = ./. + base16;

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
    package = pkgs.noto-fonts-emoji;
    name = "Noto Color Emoji";
  };
};

}
