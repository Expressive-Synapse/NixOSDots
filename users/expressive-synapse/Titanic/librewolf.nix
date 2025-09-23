{pkgs, ... }:

{

programs.firefox = {
    enable = true;
    package = pkgs.librewolf-wayland;

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
