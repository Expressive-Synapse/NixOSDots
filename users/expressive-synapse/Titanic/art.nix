{ pkgs, ... }:

{
home.packages = with pkgs; [
inkscape
blender
];

home.persistence."/persist" = {
  directories = [
    ".config/inkscape"
    ".config/blender"
  ];
};

}
