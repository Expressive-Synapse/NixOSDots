{ pkgs, ... }:
{
  programs.ghostty.enable = true;
  
  xdg.desktopEntries.ghostty = {
    name = "Ghostty";
    exec = "${pkgs.ghostty}/bin/ghostty";
  };

  xdg.mimeApps = {
    enable = true;
    defaultApplications = {
      "x-scheme-handler/terminal" = "ghostty.desktop";
    };
  };
}
