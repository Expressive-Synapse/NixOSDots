{ pkgs, inputs, ... }:
{
  environment.systemPackages = with pkgs; [
    libreoffice
    obsidian
    keepassxc
    proton-vpn
    ghostty
    gimp
    anytype
    (discord.override {
      withOpenASAR = false;
      withVencord = true;
    })
    (pkgs.wrapOBS {
    plugins = with pkgs.obs-studio-plugins; [
      wlrobs
      obs-backgroundremoval
      obs-pipewire-audio-capture
    ];
  })
  inputs.zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.default
  ];
}
