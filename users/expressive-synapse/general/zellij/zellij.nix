{ ... }:

{
programs.zellij.enable = true;

  #home.file.".config/zellij/config.kdl" = {
  #source = ./config.kdl;
  #};
home.file.".config/zellij/plugins" = {
  source = ./plugins;


};

 programs.zellij.settings = {
  plugins = {
      autolock = {
        location = "file:~/.config/zellij/plugins/zellij-autolock.wasm";
        is_enabled = true;
        triggers = "vi|vim|nvim|ncats|yazi";
        reaction_seconds = "0.3";
        print_to_log = true;
      };
    };  
  keybinds = {};  
 };

}
