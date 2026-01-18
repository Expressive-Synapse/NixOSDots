{pkgs, inputs, ...}:

{
home.packages = with pkgs; [
  bottles
];

home.persistence."/persist" = {
  directories = [
    ".local/share/bottles"
  ];
};
}
