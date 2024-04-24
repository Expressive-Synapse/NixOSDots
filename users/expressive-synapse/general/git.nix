{ ... }:

{

programs.git = {
  enable = true;
  userName = "Expressive-Synapse";
  userEmail = "ConnorDGoff@protonmail.com";
  extraConfig = {
    init.defaultBranch = "main";
  };
};

}
