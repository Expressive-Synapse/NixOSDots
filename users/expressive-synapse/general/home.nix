{ ... }:

{

imports = [
  ./git.nix
  ./nixvim.nix
  ./termFileManager.nix
  ./termSystemUtils.nix
  ./shell/bash.nix
  ./tmux.nix
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
#                 Home-Manager                    #
###################################################
home.username = "expressive-synapse";
home.homeDirectory = "/home/expressive-synapse";

programs.home-manager.enable = false;

home.stateVersion = "23.11"; # Please read the comment before changing.


}
