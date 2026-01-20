{ pkgs, inputs, ... }:

{
  home.packages = with pkgs; [
    libreoffice
    #thunderbird
    obsidian
    filezilla
    gimp3
    calibre
  ];
  /*
    home.persistence."/persist = {
      directories = [
      ];
    };
  */
}
