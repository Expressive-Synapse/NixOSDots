{ inputs, ... }:

{

imports = [ inputs.nvf.homeManagerModules.default ];

programs.nvf.enable = true;

programs.nvf.settings = {

  vim.viAlias = false;
  vim.vimAlias = true;

  vim.lsp = {

    enable = true;

  };

};

}
