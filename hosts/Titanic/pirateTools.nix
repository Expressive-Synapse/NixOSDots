{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    ns-usbloader
    qbittorrent
  ];
  # Allows ns-usbloader to connect to the Nintendo Switch
  services.udev.extraRules = ''SUBSYSTEM=="usb", ATTRS{idVendor}=="057e", ATTRS{idProduct}=="3000", MODE="0666"'';
}
