{ pkgs, ... }:

{

programs.firefox = {
    enable = true;
    package = pkgs.floorp-bin-unwrapped;
};

home.persistence."/persist/home/expressive-synapse" = {
  directories = [
   ".floorp" 
  ];
}; 

}
