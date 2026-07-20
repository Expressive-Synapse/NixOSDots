{ pkgs }:
pkgs.symlinkJoin {
  name = "helix";
  paths = [ pkgs.helix ];
  buildInputs = [ pkgs.makeWrapper ];
  postBuild =
    let
      configFile = pkgs.writeText "config" /* toml */ ''
        [[language]]
        name = "nix"
        auto-format = true;
      '';
    in
    ''
      wrapProgram $out/bin/hx \
      --append-flags "--config ${configFile}"
    '';
}
