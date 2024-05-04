{ pkgs, config, inputs, ... }:

{
environment.systemPackages = with pkgs; [
  cifs-utils
  samba
];

networking.firewall.extraCommands = ''iptables -t raw -A OUTPUT -p udp -m udp --dport 137 -j CT --helper netbios-ns'';

fileSystems."/home/expressive-synapse/Servers/ServerBoy/jellyfiles" = {
  device = "//192.168.1.29/jellyfiles";
  fsType = "cifs";
  options = let
    # this line prevents hanging on network split
    automount_opts = "x-systemd.automount,noauto,x-systemd.idle-timeout=60,x-systemd.device-timeout=5s,x-systemd.mount-timeout=5s"; 
  in ["${automount_opts},credentials=/persist/NixOSDots/secrets/samba-secrets,uid=1000,gid=100"];
};

fileSystems."/home/expressive-synapse/Servers/ServerBoy/microSD" = {
  device = "//192.168.1.29/microSD";
  fsType = "cifs";
  options = let
    # this line prevents hanging on network split
    automount_opts = "x-systemd.automount,noauto,x-systemd.idle-timeout=60,x-systemd.device-timeout=5s,x-systemd.mount-timeout=5s"; 
  in ["${automount_opts},credentials=/persist/NixOSDot/secrets/samba-secrets,uid=1000,gid=100"];

};
}

