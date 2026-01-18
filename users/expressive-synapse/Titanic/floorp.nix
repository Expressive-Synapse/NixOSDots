{ pkgs, ... }:

{

programs.firefox = {
    enable = true;
    package = pkgs.floorp-bin-unwrapped;
};

home.persistence."/persist" = {
  directories = [
   ".floorp" 
  ];
}; 

}
