{ pkgs, inputs, ... }: {

environment.systemPackages = [
 inputs.noctalia.packages.${pkgs.stdenv.hostPlatform.system}.default
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
