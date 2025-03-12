{ pkgs, ... }:

{

home.packages = with pkgs; [
 floorp 
];

home.persistence."/persist/home/expressive-synapse" = {
  directories = [
   ".floorp" 
  ];
}; 

}
