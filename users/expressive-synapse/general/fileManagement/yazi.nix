{ pkgs, ... }:

{
home.packages = with pkgs; [ 
  mpv
  unar
  pqiv
  exiftool
  fd
  feh
];

programs.yazi.enable = true;

programs.yazi.settings = {
  opener = {
    edit = [
      { run = "hx %s"; block = true; for = "unix"; }
      { run = "hx %s"; block = true; for = "windows"; }
    ];
  };
};

xdg.mimeApps = {
    enable = true;
    defaultApplications = {
      "inode/directory" = "yazi.desktop";
    };
  };
}
