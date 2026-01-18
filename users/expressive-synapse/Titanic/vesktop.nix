{ pkgs, inputs, ... }:

{
  home.packages = with pkgs; [
    vesktop
  ];

  home.persistence."/persist" = {
  directories = [
    ".config/vesktop"
  ];
};
}
