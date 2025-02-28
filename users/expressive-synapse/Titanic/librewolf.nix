{pkgs, ... }:

{

home.packages = with pkgs; [
librewolf-wayland
];

home.persistence."/persist/home/expressive-synapse" = {
  directories = [
    ".librewolf"
  ];
};  

}
