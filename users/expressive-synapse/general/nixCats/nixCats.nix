{ pkgs, config, lib, inputs, ... }: let
  utils = inputs.nixCats.utils;
in {
  imports = [
    inputs.nixCats.homeModule
  ];
  config = {
    # this value, nixCats is the defaultPackageName you pass to mkNixosModules
    # it will be the namespace for your options.
    nixCats = {
      enable = true;
      nixpkgs_version = inputs.nixpkgs;
      # this will add the overlays from ./overlays and also,
      # add any plugins in inputs named "plugins-pluginName" to pkgs.neovimPlugins
      # It will not apply to overall system, just nixCats.
      addOverlays = /* (import ./overlays inputs) ++ */ [
        (utils.standardPluginOverlay inputs)
      ];
      # see the packageDefinitions below.
      # This says which of those to install.
      packageNames = [ "ncats" ];


      luaPath = "${./.}";

      # the .replace vs .merge options are for modules based on existing configurations,
      # they refer to how multiple categoryDefinitions get merged together by the module.
      # for useage of this section, refer to :h nixCats.flake.outputs.categories
      categoryDefinitions.replace = ({ pkgs, settings, categories, extra, name, mkNvimPlugin, ... }@packageDef: {
        lspsAndRuntimeDeps = with pkgs; {
          general = [
            universal-ctags
            ripgrep
            fd
            stdenv.cc.cc
            nix-doc
            lua-language-server
            nixd
            stylua
          ];
          kickstart-debug = [
            delve
          ];
          kickstart-lint = [
            markdownlint-cli
          ];
          
        };
        startupPlugins = with pkgs.vimPlugins; {
          general = [
            vim-sleuth
            lazy-nvim
            comment-nvim
            gitsigns-nvim
            which-key-nvim
            telescope-nvim
            telescope-fzf-native-nvim
            telescope-ui-select-nvim
            nvim-web-devicons
            plenary-nvim
            nvim-lspconfig
            lazydev-nvim
            fidget-nvim
            conform-nvim
            nvim-cmp
            luasnip
            cmp_luasnip
            cmp-nvim-lsp
            cmp-path
            todo-comments-nvim
            mini-nvim
            base16-nvim
            nvim-treesitter.withAllGrammars
            zellij-nav-nvim
            undotree
          ];
          kickstart-debug = [
            nvim-dap
            nvim-dap-ui
            nvim-dap-go
            nvim-nio
          ];
          kickstart-indent_line = [
            indent-blankline-nvim
          ];
          kickstart-lint = [
            nvim-lint
          ];
          kickstart-autopairs = [
            nvim-autopairs
          ];
          kickstart-neo-tree = [
            neo-tree-nvim
            nui-nvim
            # nixCats will filter out duplicate packages
            # so you can put dependencies with stuff even if they're
            # also somewhere else
            nvim-web-devicons
            plenary-nvim
          ];

          # themer = with pkgs; [
          #   # you can even make subcategories based on categories and settings sets!
          #   (builtins.getAttr packageDef.categories.colorscheme {
          #       "onedark" = onedark-vim;
          #       "catppuccin" = catppuccin-nvim;
          #       "catppuccin-mocha" = catppuccin-nvim;
          #       "tokyonight" = tokyonight-nvim;
          #       "tokyonight-day" = tokyonight-nvim;
          #     }
          #   )
          # ];
        };
        optionalPlugins = {
          general = [];
        };
        # shared libraries to be added to LD_LIBRARY_PATH
        # variable available to nvim runtime
        sharedLibraries = {
          general = with pkgs; [
            # libgit2
          ];
        };
        environmentVariables = {
          test = {
            CATTESTVAR = "It worked!";
          };
        };
        extraWrapperArgs = {
          test = [
            '' --set CATTESTVAR2 "It worked again!"''
          ];
        };
        # lists of the functions you would have passed to
        # python.withPackages or lua.withPackages

        # get the path to this python environment
        # in your lua config via
        # vim.g.python3_host_prog
        # or run from nvim terminal via :!<packagename>-python3
        extraPython3Packages = {
          test = (_:[]);
        };
        # populates $LUA_PATH and $LUA_CPATH
        extraLuaPackages = {
          test = [ (_:[]) ];
        };
      });

      # see :help nixCats.flake.outputs.packageDefinitions
      packageDefinitions.replace = {
        # These are the names of your packages
        # you can include as many as you wish.
        ncats = {pkgs , ... }: {
          # they contain a settings set defined above
          # see :help nixCats.flake.outputs.settings
          settings = {
            wrapRc = true;
            # IMPORTANT:
            # your alias may not conflict with your other packages.
            aliases = [ "vi" "vim" "nvim" "homeVim" ];
            # neovim-unwrapped = inputs.neovim-nightly-overlay.packages.${pkgs.system}.neovim;
          };
          # and a set of categories that you want
          # (and other information to pass to lua)
          categories = {
            general = true;
            gitPlugins = true;
            customPlugins = true;
            test = true;

            kickstart-autopairs = true;
            kickstart-neo-tree = true;
            kickstart-debug = true;
            kickstart-lint = true;
            kickstart-indent_line = true;

            # this kickstart extra didnt require any extra plugins
            # so it doesnt have a category above.
            # but we can still send the info from nix to lua that we want it!
            kickstart-gitsigns = true;

            # we can pass whatever we want actually.
            have_nerd_font = true;
            
            stylix = {
              base00 = config.lib.stylix.colors.base00;
              base01 = config.lib.stylix.colors.base01;
              base02 = config.lib.stylix.colors.base02;
              base03 = config.lib.stylix.colors.base03;
              base04 = config.lib.stylix.colors.base04;
              base05 = config.lib.stylix.colors.base05;
              base06 = config.lib.stylix.colors.base06;
              base07 = config.lib.stylix.colors.base07;
              base08 = config.lib.stylix.colors.base08;
              base09 = config.lib.stylix.colors.base09;
              base0A = config.lib.stylix.colors.base0A;
              base0B = config.lib.stylix.colors.base0B;
              base0C = config.lib.stylix.colors.base0C;
              base0D = config.lib.stylix.colors.base0D;
              base0E = config.lib.stylix.colors.base0E;
              base0F = config.lib.stylix.colors.base0F;
            };

            example = {
              youCan = "add more than just booleans";
              toThisSet = [
                "and the contents of this categories set"
                "will be accessible to your lua with"
                "nixCats('path.to.value')"
                "see :help nixCats"
                "and type :NixCats to see the categories set in nvim"
              ];
            };
          };
        };
      };
    };
  };

}
