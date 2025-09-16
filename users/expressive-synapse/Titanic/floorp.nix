{ pkgs, ... }:

{

home.packages = with pkgs; [
 floorp-bin
];

home.persistence."/persist/home/expressive-synapse" = {
  directories = [
   ".floorp" 
  ];
}; 

}
