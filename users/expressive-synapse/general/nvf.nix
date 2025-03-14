{ inputs, ... }:

{

imports = [ inputs.nvf.nixosModules.default ];

programs.nvf.enable = true;

programs.nvf.settings = {

  vim.viAlias = false;
  vim.vimAlias = true;

  vim.lsp = {

    enable = true;

  };

};

}
