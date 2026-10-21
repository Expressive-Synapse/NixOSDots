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
    (writeTextFile {
      name = "attack-shark-udev-rules";
      text = ''
        #Attack Shark X1 PAW3365 PRO gaming mouse wireless adapter
        SUBSYSTEM=="input", ATTRS{idVendor}=="1d57", ATTRS{idProduct}=="fa60", MODE="0666"
        #Attack Shark X1 PAW3365 PRO gaming mouse
        SUBSYSTEM=="input", ATTRS{idVendor}=="1d57", ATTRS{idProduct}=="2111", MODE="0666"
       '';
     destination = "/etc/udev/rules.d/99-attackshark.rules";
    })
    (writeTextFile {
      name = "8bitdo-udev-rules";
      text = ''
        #8BitDo 8BitDo Pro 3 Receiver
        SUBSYSTEM=="hidraw", ATTRS{idVendor}=="2dc8", ATTRS{idProduct}=="310b", MODE="0666"
        #8BitDo 8BitDo Pro 3 Controller
        SUBSYSTEM=="hidraw", ATTRS{idVendor}=="2dc8", ATTRS{idProduct}=="310b", MODE="0666" 
        '';
      destination = "/etc/udev/rules.d/99-8bitdo.rules";
    })
  ];
  
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
