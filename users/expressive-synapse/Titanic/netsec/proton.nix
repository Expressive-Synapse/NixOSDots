{ pkgs, ... }:

{
home.packages = with pkgs; [
  protonmail-bridge-gui
];
  home.persistence."/persist/home/expressive-synapse" = {
  directories = [
    ".local/share/protonmail"
    ".config/protonmail"
    ".config/Proton/VPN"
  ];
};
}
