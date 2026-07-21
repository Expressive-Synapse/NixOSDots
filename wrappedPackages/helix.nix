{ pkgs }:
pkgs.symlinkJoin {
  name = "helix";
  paths = [ pkgs.helix ];
  runtimeInputs = [
    pkgs.nixfmt
    pkgs.nil ];
  buildInputs = [ pkgs.makeWrapper ];
  postBuild =
    let
      configFile = pkgs.writeText "config" /* toml */ ''
        [[language]]
        name = "nix"
        auto-format = true;
        formatter = {
          command = "nixfmt"
        }
      '';
    in
    ''
      wrapProgram $out/bin/hx \
      --append-flags "--config ${configFile}"
    '';
}
