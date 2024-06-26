{ config, pkgs, inputs, ... }:

{
  imports = [
  ];

###################################################
#                   FileSystem                    #
###################################################

home.persistence."/persist/home/expressive-synapse" = {
  directories = [
    "Pictures"
    "Documents"
    "Videos"
    ".ssh"
    ".local/share/keyrings"
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
