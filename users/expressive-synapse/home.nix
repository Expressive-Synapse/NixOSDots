{ config, pkgs, flakeSettings, inputs, ... }:
let
  userSettings = {
    theme = "Catppucchin-Mocha";
  };
in 
{
  imports = [
  ./general/imports.nix
  (./. + ("/" + flakeSettings.hostname) + "/imports.nix")
  (./. + ("/../../themes/" + userSettings.theme) + "/stylix.nix")
  ];
  
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
