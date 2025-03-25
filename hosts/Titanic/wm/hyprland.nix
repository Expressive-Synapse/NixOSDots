{ pkgs, inputs, ... }:

{
imports = [
  inputs.hyprland.nixosModules.default
];
/*-------------------hyprland--------------------*/
programs = {
  hyprland = {
    enable = true;
    package = inputs.hyprland.packages.${pkgs.system}.hyprland;
    xwayland = {
      enable = true;
    };
    portalPackage = pkgs.xdg-desktop-portal-hyprland;
  };
};
wayland.windowManager.hyprland.systemd.variables = ["--all"];
/*---------------desktop-portal------------------*/
xdg.portal = {
  enable = true;
  extraPortals = [
    pkgs.xdg-desktop-portal
    pkgs.xdg-desktop-portal-gtk
  ];
};
/*------------------xremap-----------------------*/
services.xremap.withWlroots = true;

/*---------------------sddm----------------------*/
services.displayManager.sddm = {
enable = true;
wayland.enable = true;
extraPackages = with pkgs; [
  libsForQt5.qt5.qtgraphicaleffects
];
};
}
