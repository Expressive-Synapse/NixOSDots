{ pkgs, inputs, ... }:

{
home.packages = with pkgs; [
libreoffice
thunderbird
obsidian
];

home.persistence."/persist/home/expressive-synapse" = {
  directories = [
    ".thunderbird"
  ];
};
}
