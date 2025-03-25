{ ... }:

{

imports = [

  ./stylix/stylix.nix

  ./git.nix
  ./nixCats/nixCats.nix
  ./helix.nix
  ./termFileManager.nix
  ./termSystemUtils.nix
  ./shell/bash.nix
  ./zellij/zellij.nix
  ./lf.nix
];

###################################################
#                   FileSystem                    #
###################################################

home.persistence."/persist/home/expressive-synapse" = {
  directories = [
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
