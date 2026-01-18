{ pkgs, ... }:

{
home.packages = with pkgs; [
  ns-usbloader
  yt-dlp
  ffmpeg
  qbittorrent
  onthespot
  picard
];

home.persistence."/persist" = {
  directories = [
    ".config/casualOnTheSpot"
    ".config/qBittorrent"
    ".local/share/qBittorrent"
    "Downloads/torrents"
  ];
};
}
