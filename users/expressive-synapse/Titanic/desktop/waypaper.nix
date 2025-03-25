{ pkgs, ... }: 
{
 home.packages = with pkgs; [
   waypaper
   swww
   hyprpaper
   mpvpaper
  ];
}
