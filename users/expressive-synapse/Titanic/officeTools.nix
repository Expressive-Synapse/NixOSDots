{ pkgs, inputs, ... }:

{
  home.packages = with pkgs; [
    libreoffice
    #thunderbird
    obsidian
    filezilla
    gimp3
    bookworm
  ];
  /*
    home.persistence."/persist = {
      directories = [
      ];
    };
  */
}
