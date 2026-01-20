{ pkgs, inputs, ... }:

{
  home.packages = with pkgs; [
    libreoffice
    #thunderbird
    obsidian
    filezilla
    gimp3
    ocular
  ];
  /*
    home.persistence."/persist = {
      directories = [
      ];
    };
  */
}
