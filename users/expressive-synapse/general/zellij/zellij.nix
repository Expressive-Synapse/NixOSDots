{ ... }:

{
programs.zellij.enable = true;

home.file.".config/zellij/config.kdl".source = ./config.kdl;
home.file.".config/zellij/plugins/zellij-autolock.wasm".source = ./plugins/zellij-autolock.wasm;
}
