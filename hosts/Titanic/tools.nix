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
    kew
    mpv
    unar
    btop
    cdemu-daemon
    dust
    fastfetch
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
}
