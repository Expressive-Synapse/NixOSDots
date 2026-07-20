{
  pkgs,
  ...
}:

{
  environment.systemPackages = with pkgs; [
    dosbox-stanging
    wineWow64Packages.waylandFull
    winetricks
  ];
  virtualisation.virtualbox.host.enable = true;
  users.extraGroups.vboxusers.members = [ "expressive-synapse" ];
  virtualisation.virtualbox.host.enableExtensionPack = true;
}
