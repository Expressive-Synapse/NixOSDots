{ ... }:

{
  imports = [
    ./desktop/wm/hyprland.nix
    ./desktop/waybar/waybar.nix
    ./desktop/waypaper.nix
    ./desktop/dunst/dunst.nix
    ./desktop/tofi.nix
    ./desktop/wlogout/wlogout.nix

    ./flameshot.nix
    ./zen-browser.nix
  ];

  ###################################################
  #                   FileSystem                    #
  ###################################################

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
