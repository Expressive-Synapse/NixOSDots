{ ... }:

{

  imports = [

    ./shell/bash.nix

    ./helix.nix
    ./starship.nix
  ];

  ###################################################
  #                   FileSystem                    #
  ###################################################

  ###################################################
  #                   Packages                      #
  ###################################################
  nixpkgs.config.allowUnfreePredicate = _: true;

  ###################################################
  #                   Packages                      #
  ###################################################
  home.sessionVariables = {
    EDITOR = "vim";
  };

  ###################################################
  #                 Home-Manager                    #
  ###################################################
  home.username = "expressive-synapse";
  home.homeDirectory = "/home/expressive-synapse";

  programs.home-manager.enable = false;

  home.stateVersion = "23.11"; # Please read the comment before changing.

}
