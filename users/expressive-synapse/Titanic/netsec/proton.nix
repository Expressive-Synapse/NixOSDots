{ pkgs, inputs, ... }:

{
home.packages = with pkgs; [
  protonvpn-gui
  protonmail-bridge-gui
];
  home.persistence."/persist/home/expressive-synapse" = {
  directories = [
    ".local/share/protonmail"
    ".config/protonmail"
  ];
};
}
