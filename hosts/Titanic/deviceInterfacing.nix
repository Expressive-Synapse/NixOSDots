{ pkgs, ... }:

{
environment.systemPackages = with pkgs; [
  #mtpfs
  simple-mtpfs
  piper
  usbutils
  jmtpfs
  glib
  via
  cdemu-daemon
  antimicrox
  linuxConsoleTools
];

programs.kdeconnect.enable = true;

programs.cdemu.enable = true;

services.ratbagd.enable = true;

services.gvfs.enable = true;

services.hardware.openrgb.enable = true;

hardware.keyboard.qmk.enable = true;

services.udev.packages = with pkgs; [
  via
];
services.udev.extraRules = ''
#8bitdo
SUBSYSTEM=="hidraw", ATTRS{idVendor}=="2dc8", ATTRS{idProduct}=="5200", MODE="0666"
SUBSYSTEM=="hidraw", ATTRS{idVendor}=="2dc8", ATTRS{idProduct}=="5201", MODE="0666"
  ''
}
