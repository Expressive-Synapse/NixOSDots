{pkgs, ... }:

{

programs.firefox = {
    enable = true;
    package = pkgs.librewolf;

    profiles = {
      expressive-synapse = {};
    };
};

home.persistence."/persist" = {
  directories = [
    ".librewolf"
  ];
};  

}
