{ pkgs, ... }:

{
environment.systemPackages = with pkgs; [
  mtpfs
  simple-mtpfs
  piper
  usbutils
  jmtpfs
  glib
  via
];

services.ratbagd.enable = true;

services.gvfs.enable = true;

hardware.keyboard.qmk.enable = true;

services.udev.packages = with pkgs; [
  via
];

}
