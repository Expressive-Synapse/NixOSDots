{ ... }:

{
imports = [

  ./terminal/foot.nix
  ./terminal/alacritty.nix
  
  ./desktop/wm/hyprland.nix
  ./desktop/waybar/waybar.nix
  ./desktop/waypaper.nix
  ./desktop/dunst/dunst.nix
  ./desktop/rofi.nix
  ./desktop/wlogout/wlogout.nix

  ./netsec/proton.nix
  ./flameshot.nix
  ./deviceInterfacing.nix
  ./floorp.nix
  ./keepass.nix
  ./discord.nix
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
