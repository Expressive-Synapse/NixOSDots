{ pkgs, inputs, ... }:

{
  home.packages = with pkgs; [
    libreoffice
    #thunderbird
    obsidian
    filezilla
    gimp3
    kdePackages.okular
  ];
  /*
    home.persistence."/persist = {
      directories = [
      ];
    };
  */
}
