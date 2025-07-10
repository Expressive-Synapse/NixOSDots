{ pkgs, inputs, ... }:

{
home.packages = with pkgs; [
libreoffice
    #thunderbird
obsidian
filezilla
gimp3
];

/*
home.persistence."/persist/home/expressive-synapse" = {
  directories = [
    ".thunderbird"
  ];
};
*/
}
