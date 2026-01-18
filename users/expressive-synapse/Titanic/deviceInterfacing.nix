{ pkgs, inputs, ... }:

{
home.packages = with pkgs; [
  #mtpfs
  simple-mtpfs
  via
  piper
];

home.persistence."/persist" = {
  directories = [
    ".config/antimicrox"
  ];
};

}
