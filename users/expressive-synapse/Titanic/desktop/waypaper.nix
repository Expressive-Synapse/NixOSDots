{ pkgs, ... }: 
{
 home.packages = with pkgs; [
   waypaper
   swww
   hyprpaper
   mpvpaper
  ];

home.persistence."/persist/home/expressive-synapse" = {
  directories = [
    ".conifg/waypaper"
  ];
};
}
