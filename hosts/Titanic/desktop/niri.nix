{pkgs, inputs, ... }: {
  programs.niri = {
    enable = true;
  };

xdg.portal = {
  enable = true;
  extraPortals = [
    pkgs.xdg-desktop-portal-gnome
    pkgs.xdg-desktop-portal-gtk
  ];
};

services.displayManager.ly = {
    enable = true;
  };
}
