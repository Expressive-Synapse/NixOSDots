{ pkgs, ... }:

{
home.packages = with pkgs; [
inkscape
blender-hip
];

home.persistence."/persist" = {
  directories = [
    ".config/inkscape"
    ".config/blender"
  ];
};

}
