{ pkgs, ... }:
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
  ];
}
