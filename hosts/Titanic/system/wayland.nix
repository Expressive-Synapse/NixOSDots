{ pkgs, ... }:

{
environment.systemPackages = with pkgs; [
  wayland
  waydroid
];

programs.xwayland.enable = true;

services.xserver = {
  enable = true;
  xkb = {
  layout = "us";
  variant = "";
  options = "caps:escape";
  };
};

}
