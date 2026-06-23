{ pkgs, inputs, ... }:

{

  home.packages = with pkgs; [
    dosbox-staging
  ];

}
