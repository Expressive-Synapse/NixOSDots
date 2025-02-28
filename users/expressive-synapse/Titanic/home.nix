{ ... }:

{
imports = [
  ../../../themes/Catppucchin-Mocha/stylix.nix

  ./terminal/foot.nix
  ./terminal/alacritty.nix
  
  ./wm/hyprland.nix
  ./wm/sway.nix

  ./netsec/proton.nix

  ./deviceInterfacing.nix
  ./firefox.nix
  ./librewolf.nix
  ./keepass.nix
  ./vesktop.nix
  ./gaming.nix
  ./winOnLinux.nix
  ./officeTools.nix
  ./pirateTools.nix
];

###################################################
#                   FileSystem                    #
###################################################

home.persistence."/persist/home/expressive-synapse" = {
  directories = [
    "Pictures"
    "Documents"
    "Videos"
  ];
  allowOther= true;
};
  
###################################################
#                   Packages                      #
###################################################
nixpkgs.config.allowUnfreePredicate = _: true;

###################################################
#                 Home-Manager                    #
###################################################
home.username = "expressive-synapse";
home.homeDirectory = "/home/expressive-synapse";

programs.home-manager.enable = false;

home.stateVersion = "23.11"; # Please read the comment before changing.

}
