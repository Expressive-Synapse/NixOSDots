{ pkgs, inputs, ... }:

{

imports = [
  inputs.ags.homeManagerModules.default
  inputs.hyprland.homeManagerModules.default
];

home.packages = with pkgs; [
  rofi-wayland
  grimblast
];

wayland.windowManager.hyprland = {
  enable = true;
  package = inputs.hyprland.packages.${pkgs.system}.hyprland;
  xwayland.enable = true;
  systemd = {
    enable = true;
    variables = ["--all"];
  };
};

wayland.windowManager.hyprland.plugins = [
  inputs.split-monitor-workspaces.packages.${pkgs.system}.split-monitor-workspaces
];

wayland.windowManager.hyprland.settings = {
  
  monitor = [
    "DP-3,2560x1440@164,0x0,1"
    "HDMI-A-1,1920x1080@60,-1080x-215,1,transform,1"
  ];

  exec-once = [
    "runuser -l expressive-synapse -c 'foot --server'"
    "zellij --session main"

  ];

  "$mod" = "SUPER";
  bind = [
   # Application Controls #
    "$mod, M, exec, hyprctl dispatch exit 1" # exit desktop
    "$mod SHIFT, Q, killactive," # close window
    "$mod, RETURN, exec, footclient zellij attach main" # open terminal
    "$mod SHIFT, RETURN, exec, footclient zellij --session main" # open terminal with new session
    "$mod, SPACE, exec, rofi -show drun" # open app launcher
    "$mod SHIFT, SPACE, exec, rofi -show run" #open program launcher

    # Window Controls #
    "$mod, V, togglefloating," # toggle windows floating
    "$mod, F, fullscreen" # toggle fullscreen
    "$mod, P, pseudo," # dwindle
    "$mod, J, togglesplit," # dwindle

    # Focus Controls #
    "$mod, left, movefocus, l"
    "$mod, right, movefocus, r"
    "$mod, up, movefocus, u"
    "$mod, down, movefocus, d"

  ] # Workspace Controls #
  ++ (
       builtins.concatLists (builtins.genList (
   x: let
     ws = let
       c = (x + 1) / 10;
     in
     builtins.toString (x + 1 - (c * 10));
   in [
     "$mod, ${ws}, split-workspace, ${toString (x + 1)}" # switches to a workspace
     "$mod SHIFT, ${ws}, split-movetoworkspace, ${toString (x + 1)}" # move active window to workspace
   ]
 )
10)
  );
  bindm = [
    # Window Mouse Controls #
    "$mod, mouse:272, movewindow" # drag window with mouse
    "$mod, mouse:273, resizewindow" # resize window with mouse
  ];
};

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

services.dunst.enable = true;


}
