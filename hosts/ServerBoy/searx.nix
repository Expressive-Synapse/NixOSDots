{ pkgs, ... }:

{

networking.firewall.allowedTCPPorts = [ 8080 ];

services.searx.enable = true;

services.searx.package = pkgs.searxng;

services.searx.settings = {
  
  use_default_settings = true;

  server.port = 8080;
  server.bind_address = "127.0.0.1";
};

}
