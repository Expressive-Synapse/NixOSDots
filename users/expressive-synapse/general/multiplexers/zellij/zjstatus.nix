{ config, lib, ... }:
{
home.file.".config/zellij/layouts/default.kdl".text = /*kdl*/''
layout {
    default_tab_template {
        children
        pane size=1 borderless=true {
            plugin location="file:~/.config/zellij/plugins/zjstatus.wasm" {

                color_base00 "#${config.lib.stylix.colors.base00}"
                color_base01 "#${config.lib.stylix.colors.base01}"
                color_base02 "#${config.lib.stylix.colors.base02}"
                color_base03 "#${config.lib.stylix.colors.base03}"
                color_base04 "#${config.lib.stylix.colors.base04}"
                color_base05 "#${config.lib.stylix.colors.base05}"
                color_base06 "#${config.lib.stylix.colors.base06}"
                color_base07 "#${config.lib.stylix.colors.base07}"
                color_base08 "#${config.lib.stylix.colors.base08}"
                color_base09 "#${config.lib.stylix.colors.base09}"
                color_base0A "#${config.lib.stylix.colors.base0A}"
                color_base0B "#${config.lib.stylix.colors.base0B}"
                color_base0C "#${config.lib.stylix.colors.base0C}"
                color_base0D "#${config.lib.stylix.colors.base0D}"
                color_base0E "#${config.lib.stylix.colors.base0E}"
                color_base0F "#${config.lib.stylix.colors.base0F}"

                format_left   "#[fg=$base0D]#[bg=$base0D,fg=$base01,bold] {session} #[bg=$base02] {mode}#[] {tabs}"
                format_center "{notifications}"
                format_right  "#[fg=$base0F]#[fg=$base01,bg=$base0F] #[bg=$base03,fg=$base0F,bold] {command_user}@{command_host}#[fg=$base03]#[fg=$base08]#[bg=$base08,fg=$base01]󰃭 #[bg=$base03,fg=$base08,bold] {datetime}#[fg=$base03]"
                format_hide_on_overlength "true"
                format_precedence "lrc"

                border_enabled  "false"
                border_char     "─"
                border_format   "#[bg=$base02]{char}"
                border_position "top"

                hide_frame_for_single_pane "true"

                mode_normal        "#[bg=$base0B,fg=$base01,bold] NORMAL#[fg=$base0B]"
                mode_tmux          "#[bg=$base0E,fg=$base01,bold] TMUX#[fg=$base0E]"
                mode_locked        "#[bg=$base08,fg=$base01,bold] LOCKED#[fg=$base08]"
                mode_pane          "#[bg=$base0C,fg=$base01,bold] PANE#[fg=base0C]"
                mode_tab           "#[bg=$base0C,fg=$base01,bold] TAB#[fg=$base0C]"
                mode_scroll        "#[bg=$base0F,fg=$base01,bold] SCROLL#[fg=$base0F]"
                mode_enter_search  "#[bg=$base0F,fg=$base01,bold] ENT-SEARCH#[bg=$surfaco,fg=$base0F]"
                mode_search        "#[bg=$base0F,fg=$base01,bold] SEARCHARCH#[bg=$surfac0,fg=$base0F]"
                mode_resize        "#[bg=$base0A,fg=$base01,bold] RESIZE#[bg=$surfac0,fg=$base0A]"
                mode_rename_tab    "#[bg=$base0A,fg=$base01,bold] RENAME-TAB#[fg=$base0A]"
                mode_rename_pane   "#[bg=$base0A,fg=$base01,bold] RENAME-PANE#[fg=$base0A]"
                mode_move          "#[bg=$base0A,fg=$base01,bold] MOVE#[fg=$base0A]"
                mode_session       "#[bg=$base0F,fg=$base01,bold] SESSION#[fg=$base0F]"
                mode_prompt        "#[bg=$base0F,fg=$base01,bold] PROMPT#[fg=$base0F]"

                tab_normal              "#[fg=$base0D]#[bg=$base0D,fg=$base01,bold]{index} #[bg=$base03,fg=$base0D,bold] {name}{floating_indicator}#[fg=$base03]"
                tab_normal_fullscreen   "#[fg=$base0D]#[bg=$base0D,fg=$base01,bold]{index} #[bg=$base03,fg=$base0D,bold] {name}{fullscreen_indicator}#[fg=$base03]"
                tab_normal_sync         "#[fg=$base0D]#[bg=$base0D,fg=$base01,bold]{index} #[bg=$base03,fg=$base0D,bold] {name}{sync_indicator}#[fg=$base03]"
                tab_active              "#[fg=$base09]#[bg=$base09,fg=$base01,bold]{index} #[bg=$base03,fg=$base09,bold] {name}{floating_indicator}#[fg=$base03]"
                tab_active_fullscreen   "#[fg=$base09]#[bg=$base09,fg=$base01,bold]{index} #[bg=$base03,fg=$base09,bold] {name}{fullscreen_indicator}#[fg=$base03]"
                tab_active_sync         "#[fg=$base09]#[bg=$base09,fg=$base01,bold]{index} #[bg=$base03,fg=$base09,bold] {name}{sync_indicator}#[fg=$base03]"
                tab_separator           "#[]"

                tab_sync_indicator       " "
                tab_fullscreen_indicator " 󰊓"
                tab_floating_indicator   " 󰹙"

                notification_format_unread "#[bg=base02,fg=$base0A]#[bg=$base0A,fg=$base01] #[bg=$base03,fg=$base0A] {message}#[fg=$base0A]"
                notification_format_no_notifications ""
                notification_show_interval "10"

                command_host_command    "uname -n"
                command_host_format     "{stdout}"
                command_host_interval   "0"
                command_host_rendermode "static"

                command_user_command    "whoami"
                command_user_format     "{stdout}"
                command_user_interval   "10"
                command_user_rendermode "static"

                datetime          "{format}"
                datetime_format   "%Y-%m-%d 󰅐 %H:%M"
                datetime_timezone "America/New_York"

            }
        }
    }
}

 '';
}
