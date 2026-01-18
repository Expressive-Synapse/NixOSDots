{ pkgs, ... }:

{

home.packages = with pkgs; [
  (discord.override {
    withOpenASAR = true;
    withVencord = true;
  })
];

home.persistence."/persist" = {
  directories = [
    ".config/discord"
    ".config/Vencord"
  ];
};

}
