{ pkgs, ... }:

{
environment.systemPackages = with pkgs; [
  mtpfs
  simple-mtpfs
  via
  piper
  usbutils
];

services.ratbagd.enable = true;

services.gvfs.enable = true;
}
