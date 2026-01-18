{ pkgs, ... }:

{
home.packages = with pkgs; [
  protonmail-bridge-gui
];
  home.persistence."/persist" = {
  directories = [
    ".local/share/protonmail"
    ".config/protonmail"
    ".config/Proton/VPN"
  ];
};
}
