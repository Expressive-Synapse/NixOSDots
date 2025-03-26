{ lib, config, ... }: 

{

imports = [
    ./style.nix
  ];
programs.waybar.enable = true;
programs.waybar.settings = {
  mainBar =  {
    layer = "top";
    position = "top";
    height = 30;
    spacing = 5;
    margin-bottom = -11;
    modules-left = [ "hyprland/workspaces" ];
    modules-right = [ "pulseaudio" "clock" "tray" ];

    "hyprland/workspaces" = {
      diable-scroll = true;
      all-outputs = false;
    };
    
    "pulseaudio" = {
        format = "{icon} {volume}";
        format-muted = "󰖁";
        tooltip-format = "{icon} {desc} // {volume}%";
        format-icons = {
            headphone = "";
            hands-free = "";
            headset = "";
            phone = "";
            portable = "";
            car = "";
            default = ["" "" ""];
        };
      };

    "clock" = {
        format = " {:%H:%M}";
      };

  };
};
}
