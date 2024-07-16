{ pkgs, inputs, ... }:

{

networking.firewall = {
  allowedUDPPorts = [ 51820 ];
};

services.resolved.enable = true;

networking.wireguard.enable = true;


}
