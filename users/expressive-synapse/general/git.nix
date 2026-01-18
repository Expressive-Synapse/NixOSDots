{ ... }:

{

programs.git = {
  enable = true;
  settings = {
    user = {
        name = "Expressive-Synapse";
        email = "ConnorDGoff@protonmail.com";
    };
    init.defaultBranch = "main";
  };
};

}
