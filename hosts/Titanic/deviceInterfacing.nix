{ pkgs, inputs, ... }:

{
  imports = [
 ];
  environment.systemPackages = with pkgs; [
    #mtpfs
    exfat
    ntfs3g
    fuse
    piper
    usbutils
    glib
    via
    cdemu-daemon
    antimicrox
    gamepad-tool
    linuxConsoleTools
    solaar
  ];

  programs.kdeconnect.enable = true;

  programs.cdemu.enable = true;

  services.ratbagd.enable = true;

  services.gvfs.enable = true;

  services.hardware.openrgb.enable = true;

  hardware.keyboard.qmk.enable = true;

  services.udev.packages = with pkgs; [
    via
  ];
  services.udev.extraRules = ''
    #8BitDo 8BitDo Pro 3 Receiver
    SUBSYSTEM=="hidraw", ATTRS{idVendor}=="2dc8", ATTRS{idProduct}=="310b", MODE="0666"
    #8BitDo 8BitDo Pro 3 Controller
    SUBSYSTEM=="hidraw", ATTRS{idVendor}=="2dc8", ATTRS{idProduct}=="310b", MODE="0666"
  '';

 
  services.xremap.enable = true;
  services.xremap.config.modmap = [
    {
      name = "cool CapsLock";
      remap = {
        CapsLock = {
          held = "leftctrl";
          alone = "esc";
          alone_timeout_millis = 150;
        };
      };
    }
  ];

  services.input-remapper.enable = true;

}
