{ pkgs }: 
  pkgs.runCommand "niri" {
  buildInputs = [ pkgs.makeWrapper ];
}let
configFile = pkgs.writeText "config" /*kdl*/''
    binds {
      Mod+Return hotkey-overlay-title="Open Terminal" {spawn "ghostty"; }
    }
  ''
in
''
    mkdir $out
    ln -s ${pkgs.niri}/* $out
    rm $out/bin
    mkdir $out/bin
    ln -s ${pkgs.niri}/bin/* $out/bin
    rm $out/bin/niri
    makeWrapper ${pkgs.niri}/bin/niri $out/bin/niri \
    --append-flags "--config ${configFile}"
  ''
