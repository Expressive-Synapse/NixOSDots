{ ... }:

{
imports = [

  ./terminal/foot.nix
  ./terminal/ghostty.nix
  
  ./desktop/wm/hyprland.nix
  ./desktop/waybar/waybar.nix
  ./desktop/waypaper.nix
  ./desktop/dunst/dunst.nix
  ./desktop/tofi.nix
  ./desktop/wlogout/wlogout.nix

  ./netsec/proton.nix
  ./art.nix
  ./flameshot.nix
  ./deviceInterfacing.nix
  ./librewolf.nix
  ./keepass.nix
  ./discord.nix
  ./gaming.nix
  ./winOnLinux.nix
  ./officeTools.nix
  ./pirateTools.nix
  ./dosbox.nix
  ./devTools.nix
  ./zen-browser.nix
];

###################################################
#                   FileSystem                    #
###################################################

home.persistence."/persist" = {
  directories = [
    "Pictures"
    "Documents"
    "Videos"
    ".local/share/FoundryVTT"
    ".config/VirtualBox"
  ];
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
