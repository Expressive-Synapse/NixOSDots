{ pkgs, inputs, ... }:

{
  imports = [
    inputs.maccel.nixosModules.default
  ];
  environment.systemPackages = with pkgs; [
    #mtpfs
    exfat
    ntfs3g
    simple-mtpfs
    piper
    usbutils
    jmtpfs
    glib
    via
    cdemu-daemon
    antimicrox
    linuxConsoleTools
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

  hardware.maccel = {
    enable = true;
    enableCli = true; # Optional: for parameter discovery
    parameters = {
      mode = "linear";
      sensMultiplier = 1.0;
      acceleration = 0.3;
      offset = 2.0;
      outputCap = 2.0;
    };
  };
}
