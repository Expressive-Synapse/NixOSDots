{ pkgs, ... }:

{
home.packages = with pkgs; [
inkscape
blender-hip
];

home.persistence."/persist/home/expressive-synapse" = {
  directories = [
    ".config/inkscape"
    ".config/blender"
  ];
};

}
