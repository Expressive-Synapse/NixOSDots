{ pkgs, inputs, ... }:

{
home.packages = with pkgs; [
libreoffice
thunderbird
];

home.persistence."/persist/home/expressive-synapse" = {
  directories = [
    ".thunderbird"
  ];
};
}
