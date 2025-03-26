{config, lib, ... }:

{

services.dunst.enable = true;

services.dunst.settings = {
  global = { 
    corner_radius = 15;
    gap_size = 10;
  };
};
}
