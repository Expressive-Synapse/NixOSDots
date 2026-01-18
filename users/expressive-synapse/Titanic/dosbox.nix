{ pkgs, inputs, ... }:

{


home.packages = with pkgs; [
  dosbox-staging
];

home.persistence."/persist" = {
  directories = [
      ".config/dosbox"
  ];
};
}
