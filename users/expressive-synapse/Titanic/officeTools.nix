{ pkgs, inputs, ... }:

{
  home.packages = with pkgs; [
    libreoffice
    #thunderbird
    obsidian
    filezilla
    gimp3
    foliate
  ];
  /*
    home.persistence."/persist = {
      directories = [
      ];
    };
  */
}
