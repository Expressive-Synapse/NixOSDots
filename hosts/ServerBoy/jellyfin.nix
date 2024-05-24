{ ... }: 

{

fileSystems."/samba/jellyfiles" = {
  device = "/dev/disk/by-uuid/05561086-50ad-4d59-b2c2-2869a1dfb008";
  fsType = "ext4";
  options = [
    "nofail"
  ];
};

services.jellyfin.enable = true;

services.jellyfin.openFirewall = true;

environment.persistence."/persist/system" = {
  hideMounts = true;
  directories = [
    "/var/lib/jellyfin"
    "/var/cache/jellyfin"
  ];
};

}
