{ pkgs, config, lib, ... }:
{

programs.rofi.enable = true;

programs.rofi.package = pkgs.rofi-wayland;

}

