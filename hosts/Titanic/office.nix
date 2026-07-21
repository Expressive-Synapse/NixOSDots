{ pkgs, inputs, ... }:
{
  environment.systemPackages = with pkgs; [
    libreoffice
    obsidian
    keepassxc
    proton-vpn
    ghostty
    (discord.override {
      withOpenASAR = false;
      withVencord = true;
    })
  inputs.zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.default
  ];
}
