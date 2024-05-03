{ pkgs, inputs, ... }:

{


home.packages = with pkgs; [
  firefox
];

home.persistence."/persist/home/expressive-synapse" = {
  directories = [
    ".mozilla"
  ];
};
}
