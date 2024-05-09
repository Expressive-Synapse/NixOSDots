{ pkgs, inputs, ... }:

{
networking.firewall.allowedTCPPorts = [ 30000 ]; #FoundryVTT
}
