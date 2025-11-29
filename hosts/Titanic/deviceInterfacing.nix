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
  cdemu-daemon
  antimicroX
];

programs.kdeconnect.enable = true;

programs.cdemu.enable = true;

services.ratbagd.enable = true;

services.gvfs.enable = true;

hardware.keyboard.qmk.enable = true;

services.udev.packages = with pkgs; [
  via
];

}
