{
  pkgs,
   ...
}:
{
  environment.systemPackages = with pkgs; [
    exiftool
    fd
    feh
    ffmpeg
    mpv
    unar
    btop
    cdemu-daemon
    dust
    fastfetch
    rmpc
    (callPackage ../../wrappedPackages/helix.nix { })
  ];

 programs.bash = {
      enable = true;
      blesh.enable = true;
 };

programs.atuin = {
  enable = true;
  enableBashIntegration = true;
};

  programs.git = {
    enable = true;
    config = [
      {
        user = {
          name = "Expressive-Synapse";
          email = "ConnorDGoff@protonmail.com";
        };
      }
    ];
  };

  programs.yazi.enable = true;

  programs.yazi.settings.yazi = {
    opener = {
      edit = [
        {
          run = "hx %s";
          block = true;
          for = "unix";
        }
        {
          run = "hx %s";
          block = true;
          for = "windows";
        }
      ];
    };
  };

  programs.cdemu.enable = true;

  services.mpd = {
    enable = true;
    openFirewall = true;
    user = "expressive-synapse";
    settings = {
      music_directory = "/home/expressive-synapse/mntMedia/Music";
    };
  };
}
