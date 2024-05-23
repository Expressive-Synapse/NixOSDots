{ ... }:

{

  # enable NAT
  networking.nat.enable = true;
  networking.nat.externalInterface = "eth0";
  networking.nat.internalInterfaces = [ "wg0" ];
  networking.firewall = {
    allowedUDPPorts = [ 51820 ];
  };

  networking.wireguard.interfaces = {

    wg0 = {
      ips = [ "10.0.0.1/8"];

      listenPort = 51820;

      privateKeyFile = "/persist/Keys/WireGuard/serverboy-privatekey";

      peers = [
        {#Titanic
        publicKey = "07K9yYdRC2eqRU2TCajFaddWDuOHC6YDdVsgbmm5MC8=";
        allowedIPs = [ "10.0.0.2/32" ];
        }

        {#Pixel 7 Pro
        publicKey = "9Ai7ipGaCF33dJwBOFV7pk/Tm0gufefiRymi3/RdMH8=";
        allowedIPs = [ "10.0.0.3/32" ];
        }
      ];      
    };
  };

}
