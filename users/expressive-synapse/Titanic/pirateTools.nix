{ pkgs, inputs, ... }:

{
home.packages = with pkgs; [
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
  ];
};
}
