{ pkgs, inputs, ... }:

{
home.packages = with pkgs; [
  protonvpn-gui
  protonmail-bridge-gui
];
}
