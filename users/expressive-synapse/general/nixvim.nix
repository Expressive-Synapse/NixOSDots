{ inputs, pkgs, ... }:

{

imports = [ inputs.nixvim.homeManagerModules.nixvim ];

###################################################
#              General Configuration              #
###################################################
programs.nixvim.enable = true;

programs.nixvim.defaultEditor = true;

programs.nixvim.viAlias = true;
programs.nixvim.vimAlias = true;

programs.nixvim.opts = {
  number = true;

  expandtab = true;
  tabstop = 2;
  softtabstop = 2;
  shiftwidth =2;
};
###################################################
#              Plugins Configuration              #
###################################################
/*------------------autoclose-------------------*/
programs.nixvim.plugins.autoclose = {
  enable = true;
};
/*-------------------lualine--------------------*/
programs.nixvim.plugins.lualine = {
  enable = true;
};
/*---------------indent-blankline---------------*/
programs.nixvim.plugins.indent-blankline = {
  enable = true;
};
/*-----------------vim-css-color----------------*/
programs.nixvim.plugins.vim-css-color = {
  enable = true;
};
/*------------------transparent-----------------*/
programs.nixvim.plugins.transparent = {
  enable = true;
};
/*------------------telescope-------------------*/
programs.nixvim.plugins.telescope = {
  enable = true;
};
/*------------------neo-tree--------------------*/
programs.nixvim.plugins.neo-tree = {
  enable = true;
};
/*------------------treesitter------------------*/
programs.nixvim.plugins.treesitter = {
  enable = true;
};
/*------------------obsidian--------------------*/
programs.nixvim.plugins.obsidian = {
  enable = false;
};
/*------------------zen-mode--------------------*/
programs.nixvim.plugins.zen-mode = {
  enable = true;
};
/*------------------which-key-------------------*/
programs.nixvim.plugins.which-key = {
  enable =true;
};
/*------------------luasnip---------------------*/
programs.nixvim.plugins.luasnip = {
  enable = true;
};
/*---------------------LSP----------------------*/
programs.nixvim.plugins.lsp = {
  enable = true;
  servers = {
    tsserver.enable = true;
    pyright.enable = true;
    lua-ls.enable = true;
    bashls.enable = true;
    cssls.enable = true;
    html.enable = true;
    nixd.enable = true;
  };
};
/*------------------lsp-format------------------*/
programs.nixvim.plugins.lsp-format = {
  enable = true;
};
/*---------------------CMP----------------------*/
programs.nixvim.plugins.cmp = {
  enable = true;
  autoEnableSources = true;
  settings.sources = [
    {name = "nvim_lsp";}
    {name = "path";}
    {name = "buffer";}
    {name = "luasnip";}
  ];
  settings.mapping = {
    "<CR>" = "cmp.mapping.confirm({ select = true })";
    "<Tab>" = "cmp.mapping(function(fallback)
        luasnip = require('luasnip')
        if cmp.visible() then
          cmp.select_next_item()
        elseif luasnip.expandable() then
          luasnip.expand()
        elseif luasnip.expand_or_jumpable() then
          luasnip.expand_or_jump()
        else
          fallback()
        end
      end,
      { 'i', 's' })";
  };
};
/*------------------none-ls--------------------*/
programs.nixvim.plugins.none-ls = {
  enable = true;
  enableLspFormat = true;
};
###################################################
#                    Keymaps                      #
###################################################

programs.nixvim.globals.mapleader = " ";
programs.nixvim.keymaps = [
/*--------------------General------------------*/
#splits navigation
{
mode = [ "n" ];
key = "<C-h>";
action = "<C-w>h";
}
{
mode = [ "n" ];
key = "<C-j>";
action = "<C-w>j";
}
{
mode = [ "n" ];
key = "<C-k>";
action = "<C-w>k";
}
{
mode = [ "n" ];
key = "<C-l>";
action = "<C-w>l";
}
/*------------------Telescope------------------*/
{
options.desc = "Live Grep";
mode = [ "n" ];
key = "<leader>fg";
action = "<cmd>Telescope Live_grep<CR>";
}
{
options.desc = "Find Files";
mode = [ "n" ];
key = "<leader>ff";
action = "<cmd>Telescope Find_files<CR>";
}
/*---------------------CMP---------------------*/
/*{
mode = [ "i" "s" ];
key = "<Tab>";
lua = true;
options.remap = true;
action = "function(fallback)
        luasnip = require('luasnip')
        cmp = require('cmp')
        if cmp.visible() then
          cmp.select_next_item()
      elseif luasnip.expandable() then
        luasnip.expand()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      elseif check_backspace() then 
        fallback()
      else
        fallback()
      end
    end";
}*/
/*------------------neo-tree-------------------*/
{
options.desc = "File Tree";
mode = [ "n" ];
key = "<leader>ft";
action = "<cmd>:Neotree filesystem reveal float<CR>";
}
{
options.desc = "Buffer Tree";
mode = [ "n" ];
key = "<leader>fb";
action = "<cmd>:Neotree buffers reveal float<CR>";
}
/*-------------------none-ls--------------------*/
{
options.desc = "format code";
mode = [ "n" ];
key = "<leader>cf";
action.__raw = "vim.lsp.buf.format";
}
/*------------------zenmode---------------------*/
{
options.desc = "ZenMode";
mode = [ "n" ];
key = "<leader>z";
action = "<cmd>:ZenMode<CR>";
}
];

}
