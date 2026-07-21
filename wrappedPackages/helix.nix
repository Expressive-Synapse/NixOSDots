{ pkgs }:
pkgs.symlinkJoin {
  name = "helix";
  paths = [
    pkgs.nixfmt
    pkgs.nil
    pkgs.helix
  ];
  buildInputs = [ pkgs.makeWrapper ];
  postBuild =
    let
      configFile = pkgs.writeText "config" /* toml */ ''
         '';
    in
    ''
      wrapProgram $out/bin/hx \
      --append-flags "--config ${configFile}"
    '';
}
