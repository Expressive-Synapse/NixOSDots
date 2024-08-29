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

home.persistence."/persist/home/expressive-synapse" = {
  directories = [
    ".config/casualOnTheSpot"
    ".config/qBittorrent"
    ".local/share/qBittorrent"
    "Downloads/torrents"
  ];
};
}
