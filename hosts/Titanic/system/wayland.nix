{ pkgs, inputs, ... }:

{
environment.systemPackages = with pkgs; [
  wayland
  waydroid
];
services.xserver = {
  enable = true;
  xkb = {
  layout = "us";
  variant = "";
  options = "caps:escape";
  };
};

}
