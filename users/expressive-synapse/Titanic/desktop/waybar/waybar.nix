{ pkgs, ... }: 

{
programs.waybar.enable = true;
programs.waybar.settings = {
  mainBar =  {
    layer = "top";
    position = "top";
    height = 30;
    modules-left = [ "hyprland/workspaces" ];
    modules-right = [ "pulseaudio" "clock" "tray" ];

    "hyprland/workspaces" = {
      diable-scroll = true;
    };
  };
};
}
