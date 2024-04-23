{ pkgs, inputs, ... }:

{
 services.gnome = {
    gnome-keyring.enable = true;
  };

}
