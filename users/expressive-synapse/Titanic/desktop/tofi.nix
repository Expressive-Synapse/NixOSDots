{ config, lib, ... }:
{
  programs.tofi.enable = true;

  programs.tofi.settings = {
    # Font
    font = config.stylix.fonts.monospace.name;
    font-size = config.stylix.fonts.sizes.popups;

    # Window Style
    horizontal = true;
    anchor = "top";
    width = "100%";
    height = 48;
    
    outline-width = 0;
    border-width = 0;
    min-input-width = 120;
    result-spacing = 30;
    padding-top = 8;
    padding-bottom = 0;
    padding-left = 20;
    padding-right = 0;

    # Text style
    prompt-text = "Can I have a";
    prompt-padding = 30;

    background-color = "#${config.lib.stylix.colors.base00}";
    text-color = "#${config.lib.stylix.colors.base06}";

    prompt-background = "#${config.lib.stylix.colors.base0E}";
    prompt-background-padding = "4, 10";
    prompt-background-corner-radius = 12;

    input-color = "#${config.lib.stylix.colors.base07}";
    input-background = "#${config.lib.stylix.colors.base0F}";
    input-background-padding = "4, 10";
    input-background-corner-radius = 12;

    alternate-result-background = "#${config.lib.stylix.colors.base0C}";
    alternate-result-background-padding = "4, 10";
    alternate-result-background-corner-radius = 12;

    selection-color = "#${config.lib.stylix.colors.base09}";
    selection-background = "#${config.lib.stylix.colors.base0D}";
    selection-background-padding = "4, 10";
    selection-background-corner-radius = 12;
    selection-match-color = "#fff";

    clip-to-padding = false;
  };
}
