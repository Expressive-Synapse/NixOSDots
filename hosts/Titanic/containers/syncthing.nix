{ ... }:
{

  virtualisation.oci-containers.containers."syncthing" = {
    image = "lscr.io/linuxserver/syncthing:latest";
    user = "root";
    ports = [
      "8384:8384"
      "22000:22000/tcp"
      "22000:22000/udp"
      "21027:21027/udp"
    ];
    volumes = [
      "/persist/syncthing:/config"
      "/persist/home/expressive-synapse/Documents/Obsidian/:/Obsidian"
      "/persist/home/expressive-synapse/Documents/Passwords/:/Passwords"
      "/persist/home/expressive-synapse/Documents/Backups/:/Backups"
    ];
  };


}
