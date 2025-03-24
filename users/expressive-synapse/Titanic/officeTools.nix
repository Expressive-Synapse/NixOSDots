{ pkgs, inputs, ... }:

{
home.packages = with pkgs; [
libreoffice
    #thunderbird
obsidian
filezilla
];

/*
home.persistence."/persist/home/expressive-synapse" = {
  directories = [
    ".thunderbird"
  ];
};
*/
}
