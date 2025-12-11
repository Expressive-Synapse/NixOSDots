{ pkgs, lib, config, ... }:

{
virtualisation.virtualbox.host.enable = true;
users.extraGroups.vboxusers.members = [ "expressive-synapse" ];
virtualisation.virtualbox.host.enableExtensionPack = false;
}
