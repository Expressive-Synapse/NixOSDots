{ pkgs, ... }:

{
home.packages = with pkgs; [
  prismlauncher
];

home.persistence."/persist/home/expressive-synapse" = {
  directories = [
   # ".steam"
    ".local/share/Steam"
  ];
};
}

