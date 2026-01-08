{ pkgs, inputs, ... }:

{
networking.firewall.enable = true;
networking.firewall.allowedTCPPorts = [ 30000 ]; #FoundryVTT
networking.firewall.allowedUDPPorts = [ 30000 ];
}
