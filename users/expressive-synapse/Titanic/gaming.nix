{ pkgs, inputs, ... }:

{
home.persistence."/persist/home/expressive-synapse" = {
  directories = [
    ".steam"
    ".local/share/Steam"
  ];
  files = [
    ".steampath"
    ".steampid"
  ];
};
}

