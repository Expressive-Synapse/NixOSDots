{ pkgs }:
pkgs.symlinkJoin {
    name = "niri";
    buildInputs = [ pkgs.makeWrapper ];
    paths = [ pkgs.niri ];
    postBuild = let 
configFile = pkgs.writeText "config" ''
    bind {
      Mod+Return hotkey-overlay-title="Open Terminal" { spawn "ghostty"; }
    }
  '';
in
''
        wrapProgram $out/bin/niri \
        --append-flags "--config ${configFile}"
         '';
}
