{ pkgs, inputs, ... }:

{
  home.packages = with pkgs; [
    keepassxc
  ];
}
