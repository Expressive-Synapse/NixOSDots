{ pkgs, ... }:

{
  home.packages = with pkgs; [
    ns-usbloader
    yt-dlp
    ffmpeg
    qbittorrent
    picard
  ];

}
