{ inputs, pkgs, ... }:

{

imports = [
  inputs.stylix.homeManagerModules.stylix
  ];

stylix.enable = true;

  stylix.base16Scheme = "./themes/Catppuccin Mocha.yaml";

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

stylix.opacity = {
    terminal = 0.7;
  };

stylix.targets.floorp = {
  profileNames = [
      "default"
    ];
  colorTheme.enable = true;
  };

}
