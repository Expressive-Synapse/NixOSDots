{ pkgs, ... }:

{
environment.systemPackages = with pkgs; [
  mtpfs
  simple-mtpfs
  via
  piper
  usbutils
  jmtpfs
  glib
];

services.ratbagd.enable = true;

services.gvfs.enable = true;
}
