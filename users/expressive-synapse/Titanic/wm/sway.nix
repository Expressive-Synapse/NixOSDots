{ pkgs, inputs, ... }:

{
wayland.windowManager.sway.enable = true;

programs.waybar.enable = true;
}
