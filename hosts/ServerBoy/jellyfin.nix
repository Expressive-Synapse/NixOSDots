{ ... }: 

{

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
