{ pkgs, ... }:

{
home.packages = with pkgs; [
  prismlauncher
  suyu
];

home.persistence."/persist/home/expressive-synapse" = {
  directories = [
   # ".steam"
    ".local/share/Steam"
    ".local/share/PrismLauncher"
    ".local/share/suyu"
    ".config/suyu"
    ".config/retroarch"
  ];
};
}

