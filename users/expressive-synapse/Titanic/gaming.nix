{ pkgs, ... }:

{
home.packages = with pkgs; [
  prismlauncher
  r2modman
  scarab
  olympus
];

home.persistence."/persist/home/expressive-synapse" = {
  directories = [
   # ".steam"
    ".local/share/Steam"
    ".local/share/PrismLauncher"
    ".config/retroarch"
    "Zomboid"
  ];
};
}

