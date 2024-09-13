{ pkgs, inputs, ... }:

{
home.packages = with pkgs; [
  mtpfs
  simple-mtpfs
  via
  piper
];
}
