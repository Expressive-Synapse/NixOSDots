{ ... }:

{
  imports = [
#    ./desktop/wm/hyprland.nix
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
