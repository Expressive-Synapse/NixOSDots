{ pkgs, ... }:

{
nixpkgs.config.packageOverrides = pkgs: {
    steam = pkgs.steam.override {
      extraPkgs = pkgs: with pkgs; [
        xorg.libXcursor
        xorg.libXi
        xorg.libXinerama
        xorg.libXScrnSaver
        libpng
        libpulseaudio
        libvorbis
        stdenv.cc.cc.lib
        libkrb5
        keyutils
      ];
    };
  };

 environment.systemPackages = with pkgs; [
  mangohud
  (retroarch.override {
    cores = with libretro; [
      genesis-plus-gx
      snes9x
      beetle-psx-hw
    ];
  })
 ];

 programs.steam.enable = true;
 programs.steam.gamescopeSession.enable = true;
 programs.gamemode.enable = true;

 services.xserver.desktopManager.retroarch.enable = true;
 
}
