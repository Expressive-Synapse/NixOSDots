{config, lib, ... }:
let

  transparancy = builtins.mul config.stylix.opacity.popups 100;

in
{

services.dunst.enable = true;

services.dunst.settings = {
  corner_radius = 15;
  gap_size = 10;
};
}
