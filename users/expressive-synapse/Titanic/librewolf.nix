{pkgs, ... }:

{

programs.firefox = {
    enable = true;
    package = pkgs.librewolf;

    profiles = {
      expressive-synapse = {};
    };
};

home.persistence."/persist/home/expressive-synapse" = {
  directories = [
    ".librewolf"
  ];
};  

}
