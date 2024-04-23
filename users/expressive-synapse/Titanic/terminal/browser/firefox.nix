{ pkgs, input, ... }:

{
home.packages = with pkgs; [
firefox
];
programs.kitty.enable = true;

}
