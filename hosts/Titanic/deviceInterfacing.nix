{ pkgs, ... }:

{
environment.systemPackages = with pkgs; [
  mtpfs
  simple-mtpfs
  via
  piper
];

services.ratbagd.enable = true;
}
