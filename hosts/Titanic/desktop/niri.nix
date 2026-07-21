{ pkgs, inputs, ... }: {

environment.systemPackages = [
  pkgs.xwayland-satellite
 inputs.noctalia.packages.${pkgs.stdenv.hostPlatform.system}.default
];

fonts.packages = with pkgs; [
  nerd-font.terminess-ttf
  nerd-font.commit-mono
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
