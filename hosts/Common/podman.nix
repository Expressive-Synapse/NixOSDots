{ pkgs, ... }:

{

environment.systemPackages = with pkgs; [
  pdoman-compose 
];

virtualisation.podman = {
  enable = true;
  dockerCompat = true;
  autoPrune = {
    enable = true;
    dates = "weekly";
    flags = [
      "--filter=until=24h"
      "--filter=label!=important"
    ];
  };
};

}
