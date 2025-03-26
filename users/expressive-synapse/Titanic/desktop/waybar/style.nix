{ lib, config, ... }:

let
  colors = config.lib.stylix.colors.withHashtag;
in

{

programs.waybar.style = ''
* {
  border: none;
  border-radius: 0px;
  font-family: "${config.stylix.fonts.monospace.name}";
  font-weight: bold;
  font-size: 15px;
  min-height: 13px;
}

window#waybar {
  background-color: rgba(0, 0, 0, 0);
}

#battery,
#temperature,
#clock,
#workspaces,
#custom-rofi,
#tray,
#pulseaudio,
#backlight,
#network,
#custom-right,
#custom-left {
  color: ${colors.base06}; 
  background: ${colors.base01}; 
  margin: 4px 0px 4px 0px;
  border-radius: 9px;
  opacity: 1;
  border: 0px solid ${colors.base00};
}

tooltip {
  background: ${colors.base01}; 
  color: ${colors.base06};
  border-radius: 22px;
  border-width: 2px;
  border-style: solid;
  border-color: ${colors.base02}; 
}

#workspaces button {
  box-shadow: none;
  text-shadow: none;
  padding: 0px;
  border-radius: 9px;
  margin-top: 3px;
  margin-bottom: 3px;
  padding-left: 3px;
  padding-right: 3px;
  color: ${colors.base06}; 
  animation: gradient_f 20s ease-in infinite;
  transition: all 0.5s cubic-bezier(0.55, -0.68, 0.48, 1.682);
}

#workspaces button.active {
  background: ${colors.base03}; 
  color: ${colors.base0C}; 
  margin-left: 3px;
  padding-left: 12px;
  padding-right: 12px;
  margin-right: 3px;
  animation: gradient_f 20s ease-in infinite;
  transition: all 0.3s cubic-bezier(0.55, -0.68, 0.48, 1.682);
}

#workspaces button:hover {
  background: ${colors.base01};
  border: none;
}

#workspaces {
  padding: 0px;
  padding-left: 5px;
  padding-right: 5px;
}

#custom-rofi {
  color: ${colors.base09};
  padding-left: 0px;
  padding-right: 10px;
}
#temperature {
  color: ${colors.base05}; 
  padding-left: 0px;
  padding-right: 19px;
}

#temperature.critical {
  color: ${colors.base08}; 
  padding-left: 0px;
  padding-right: 19px;
}

#backlight {
  color: ${colors.base0A}; 
  padding-left: 0px;
  padding-right: 19px;
}

#pulseaudio {
  color: ${colors.base0E}; 
  padding-left: 0px;
  padding-right: 19px;
}

#battery {
  color: ${colors.base0C}; /* Rose Pine Moon - Pine */
  padding-left: 0px;
  padding-right: 0px;
}

#tray {
  padding-left: 0px;
  padding-right: 19px;
}

#network {
  padding-left: 0px;
  padding-right: 19px;
}

#clock {
  color: ${colors.base09};
  padding-left: 0px;
  padding-right: 0px;
}

#custom-right {
  margin-right: 9px;
  padding-right: 3px;
  border-radius: 0px 22px 22px 0px;
}

#custom-left {
  margin-left: 9px;
  padding-left: 3px;
  border-radius: 22px 0px 0px 22px;
}

'';

}
