{ pkgs, inputs, ... }:

{
 home.packages = with pkgs; [
  xdg-utils
  btop
  dust
 ];
}
