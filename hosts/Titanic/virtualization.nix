{
  pkgs,
  ...
}:

{
  environment.systemPackages = with pkgs; [
    dosbox-staging
    wineWow64Packages.waylandFull
    winetricks
  ];
  virtualisation.virtualbox.host.enable = true;
  users.extraGroups.vboxusers.members = [ "expressive-synapse" ];
  virtualisation.virtualbox.host.enableExtensionPack = true;
}
