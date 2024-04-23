{ pkgs, inputs, ... }:

{
home.packages = with pkgs; [
  yt-dlp
  ffmpeg
  qbittorrent
  onthespot
  picard
];
}
