{ pkgs, inputs, ... }:

{
home.packages = with pkgs; [
  mtpfs
  simple-mtpfs
  via
  piper
];

home.persistence."/persist/home/expressive-synapse" = {
  directories = [
    ".config/antimicrox"
  ];
};

}
