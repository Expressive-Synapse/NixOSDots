{pkgs, inputs, ...}:

{
home.packages = with pkgs; [
  bottles
];

home.persistence."/persist/home/expressive-synapse" = {
  directories = [
    ".local/share/bottles"
  ];
};
}
