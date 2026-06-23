{ pkgs, inputs, ... }:

{
  home.packages = with pkgs; [
    xev
  ];

}
