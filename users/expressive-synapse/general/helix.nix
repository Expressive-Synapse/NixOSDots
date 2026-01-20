{ lib, pkgs, ... }:

{
  home.packages = with pkgs; [
    nil # nix language server
  ];
  programs.helix = {
    enable = true;
    languages.language = [
      {
        name = "nix";
        auto-format = true;
        formatter.command = lib.getExe pkgs.nixfmt;
      }
    ];
  };
}
