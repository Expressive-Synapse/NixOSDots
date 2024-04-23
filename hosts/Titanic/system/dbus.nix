{ pkgs, inputs, ... }:

{
 services.dbus = {
    enable = true;
    packages = with pkgs; [
      dconf
    ];
  };

  programs.dconf = {
    enable = true;
  };

}
