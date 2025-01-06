{ ... }:

{

networking.firewall.allowedTCPPorts = [ 8384 22000 ];
networking.firewall.allowedUDPPorts = [ 22000 21027 ];

services.syncthing = {
  enable = true;
  openDefaultPorts = true;
  configDir = "/persist/Keys/syncthing/";
};
}
