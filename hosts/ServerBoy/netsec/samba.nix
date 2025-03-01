{ ... }:

{

services.samba = {
  enable = true;
  openFirewall = true;
  settings = { 
    global = {
      workgroup = "WORKGROUP";
      "server string" = "smbnix";
      "server role" = "standalone server";
    };
  };
  settings = {
    global = {
      security = "user";
    };
    jellyfiles = {
      path = "/samba/jellyfiles";
      writable = "yes";
      browsable = "yes";
      "create mask" = "0770";
      "directory mask" = "0770";
      "read only" = "no";
      "guest ok" = "no";
      "force group" = "jellyfin";
    };
    microSD = {
      path = "/samba/microSD";
      writable = "yes";
      browsable = "yes";
      "create mask" = "0770";
      "directory mask" = "0770";
      "read only" = "no";
      "guest ok" = "no";
    };
  };
};

networking.firewall.enable = true;
networking.firewall.allowPing = true;


environment.persistence."/persist/system" = {
  hideMounts = true;
  directories = [
    "/samba"
    "/var/lib/samba"
  ];
};


}
