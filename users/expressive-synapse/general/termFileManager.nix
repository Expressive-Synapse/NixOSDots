{ pkgs, ... }:

{
home.packages = with pkgs; [ 
  mpv
  unar
  pqiv
  exiftool
  fd
];

programs.yazi.enable = true;
}
