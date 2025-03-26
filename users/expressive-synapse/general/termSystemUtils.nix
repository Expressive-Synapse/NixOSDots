{ pkgs, inputs, ... }:

{
 home.packages = with pkgs; [
  xdg-utils
  dust
 ];
programs.btop.enable = true;
programs.btop.settings = {
    theme_background = false;
  };
}
