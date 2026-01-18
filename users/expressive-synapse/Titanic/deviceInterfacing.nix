{ pkgs, inputs, ... }:

{
home.packages = with pkgs; [
];

home.persistence."/persist" = {
  directories = [
    ".config/antimicrox"
  ];
};

}
