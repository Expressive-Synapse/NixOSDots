{ pkgs, ... }:

{
  home.packages = with pkgs; [
    atuin
    blesh
  ];

programs.bash = {
  enable = true;
  shellAliases = {
    ll = "ls -l";
    ".." = "cd ..";
  };
  initExtra = "source \"$(blesh-share)\"/ble.sh --attach=none\n
      eval \"$(atuin init bash)\"\n
      [[ \${BLE_VERSION-} ]] && ble-attach";
  
};

}
