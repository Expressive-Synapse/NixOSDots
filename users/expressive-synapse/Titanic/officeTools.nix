{ pkgs, inputs, ... }:

{
  home.packages = with pkgs; [
    libreoffice
    #thunderbird
    obsidian
    filezilla
    gimp3
    foliate
    kdePackages.kdenlive
  ];
  /*
    home.persistence."/persist = {
      directories = [
      ];
    };
  */
}
