{ pkgs, inputs, ... }:

{
  home.packages = with pkgs; [
    xev
  ];

  home.persistence."/persist" = {
    directories = [
      ".config/antimicrox"
    ];
  };

}
