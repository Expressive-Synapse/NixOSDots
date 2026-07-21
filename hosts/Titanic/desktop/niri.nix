{ pkgs, ... }: {

environment.systemPackages = with pkgs; [
  noctalia-shell
];
  
  programs.niri = {
    enable = true;
#   package = (pkgs.callPackage ../../../wrappedPackages/niri.nix { });
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
