{ pkgs, ... }:

{
  # Adds Steam and necessary ibraries
  nixpkgs.config.packageOverrides = pkgs: {
    steam = pkgs.steam.override {
      extraPkgs =
        pkgs: with pkgs; [
          libxcursor
          libxi
          libxinerama
          libxscrnsaver
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
    #adds retroarch and cores
    (retroarch.withCores (
      cores: with cores; [
        genesis-plus-gx
        snes9x
        beetle-psx-hw
        mame
        beetle-pcfx
        beetle-pce
        mupen64plus
      ]
    ))
    mangohud
    protontricks
    parsec-bin

    lutris
    prismlauncher
    r2modman
    scarab
    olympus
    vintagestory
  ];

  programs.steam.enable = true;
  programs.steam.gamescopeSession.enable = true;
  programs.gamemode.enable = true;

  services.xserver.desktopManager.retroarch.enable = true;

}
