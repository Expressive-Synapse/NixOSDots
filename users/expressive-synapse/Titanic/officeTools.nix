{ pkgs, inputs, ... }:

{
  home.packages = with pkgs; [
    libreoffice
    #thunderbird
    obsidian
    filezilla
    gimp3
    okular
  ];
  /*
    home.persistence."/persist = {
      directories = [
      ];
    };
  */
}
