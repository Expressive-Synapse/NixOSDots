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
  initExtra = /*bash*/"
    source \"$(blesh-share)\"/ble.sh --attach=none\n
    eval \"$(atuin init bash)\"\n
    [[ \${BLE_VERSION-} ]] && ble-attach
  ";
  bashrcExtra = /*bash*/"
    eval \"\$(starship init bash)\"\n
    fastfetch
  ";
  
};
home.persistence."/persist/home/expressive-synapse" = {
  directories = [
    ".local/share/atuin"
  ];
};

}
