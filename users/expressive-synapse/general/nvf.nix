{ inputs, ... }:

{

imports = [ inputs.nvf.nixosModules.defualt ];

programs.nvf.enable = true;

programs.nvf.settings = {

  vim.viAlias = false;
  vim.vimAlias = true;

  vim.lsp = {

    enable = true;

  };

};

}
