{ pkgs, ... }:

{

home.packages = with pkgs; [
  (discord.override {
    withOpenASAR = true;
    withVencord = true;
  })
];

home.persistence."/persist/home/expressive-synapse" = {
  directories = [
    ".config/discord"
    ".config/Vencord"
  ];
};

}
