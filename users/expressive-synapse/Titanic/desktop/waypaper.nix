{ pkgs, ... }: 
{
 home.packages = with pkgs; [
   waypaper
   swww
   hyprpaper
   mpvpaper
  ];

home.persistence."/persist" = {
  directories = [
    ".config/waypaper"
  ];
};
}
