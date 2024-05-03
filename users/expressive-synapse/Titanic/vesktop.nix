{ pkgs, inputs, ... }:

{
  home.packages = with pkgs; [
    vesktop
  ];

  home.persistence."/persist/home/expressive-synapse" = {
  directories = [
    ".config/vesktop"
  ];
};
}
