{ pkgs, config, ... }:
{
services.flameshot = {
  enable = true;
  package = (pkgs.flameshot.override {
      enableWlrSupport = true;
    });
  };
  settings = {
    General = {
      useGrimAdapter = true;

      disabledTrayIcon = true;

      savePath = "${config.home.homeDirectory}/Pictures/Screenshots";
      savePathFixed = true; 
      saveAsFileExtension = ".jpg";
      filenamePattern = "%F_%H-%M";
      drawThickness = 1;
      copyPathAfterSave = true;
    };
  };
}
