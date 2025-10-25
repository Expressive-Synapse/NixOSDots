{ pkgs, inputs, ... }:

{


home.packages = with pkgs; [
  dosbox-staging
];

home.persistence."/persist/home/expressive-synapse" = {
  directories = [
  ];
};
}
