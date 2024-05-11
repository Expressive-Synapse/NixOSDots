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
 ];

 programs.steam.enable = true;
 programs.steam.gamescopeSession.enable = true;
 programs.gamemode.enable = true;

 environment.sessionVariables = {
  STEAM_EXTRA_COMPAT_TOOLS_PATHS = "/home/expressive-synapse/Games/SteamLibrary/compat";
 }; 
}
