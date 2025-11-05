{ pkgs, inputs, lib, config, ... }:

{

imports = [
  inputs.ags.homeManagerModules.default
  inputs.hyprland.homeManagerModules.default
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
 
  general = {
    "col.active_border" = "rgba(${config.lib.stylix.colors.base0E}ff) rgba(${config.lib.stylix.colors.base0C}ff) rgba(${config.lib.stylix.colors.base0A}ff) 10deg";

    "col.inactive_border" = "rgba(${config.lib.stylix.colors.base03}ff)";
  };

  decoration = {
    "rounding" = "15";
  };

  monitor = [
    "DP-3,2560x1440@164,1080x215,1"
    "HDMI-A-1,1920x1080@60,0x0,1,transform,1"
  ];

  exec-once = [
    "waybar"
    "waypaper --restore"
  ];

  "$mod" = "SUPER";
  bind = [
   # Application Controls #
    "$mod, M, exec, wlogout" # open wlogout
    "$mod SHIFT, Q, killactive," # close window
    "$mod, RETURN, exec, ghostty" # open terminal
    "$mod, SPACE, exec, tofi-drun | xargs hyprctl dispatch exec --" # open app launcher
    "$mod SHIFT, SPACE, exec, tofi-run | xargs hyprctl dispatch exec --" #open program launcher

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

    # Screen Capture #
    ", Print, exec, XDG_CURRENT_DESKTOP=sway flameshot gui"
    "SHIFT, Print, exec, XDG_CURRENT_DESKTOP=sway flameshot screen"

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

  windowrule = [
    # Flameshot compatibility rules #
    "noanim, title:flameshot"
    "float, title:flameshot"
    "move 0 0, title:flameshot"
    "pin, title:flameshot"
    "noinitialfocus, title:flameshot"
    "monitor HDMI-A-1, title:flameshot" # Set to left most monitor
  ];
};


}
