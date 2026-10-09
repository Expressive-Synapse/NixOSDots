{ pkgs, inputs, ... }:

{
  imports = [
    inputs.maccel.nixosModules.default
    inputs.yeetmouse.nixosModules.default
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

  hardware.yeetmouse = {
    enable = true;
    sensitivity = 1.0;
  };
  # hardware.maccel = {
  #   enable = true;
  #   enableCli = true; # Optional: for parameter discovery
  #   parameters = {
  #     mode = "natural";
  #     sensMultiplier = 0.3;
  #     inputDpi = 1500.0;
  #     acceleration = 0.3;
  #     offset = 2.0;
  #     outputCap = 2.0;
  #   };
  # };
  
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
