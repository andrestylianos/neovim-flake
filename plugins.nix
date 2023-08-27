{
  pkgs,
  inputs,
}: let
  nvim-lsp-notify-plugin = pkgs.vimUtils.buildVimPlugin {
    name = "nvim-lsp-notify";
    src = inputs.nvim-lsp-notify;
  };
  flash-nvim = pkgs.vimUtils.buildVimPlugin {
    name = "flash.nvim";
    src = inputs.flash-nvim;
  };
  nvim-paredit = pkgs.vimUtils.buildVimPlugin {
    name = "nvim-paredit";
    src = inputs.nvim-paredit;
  };
in
  with pkgs.vimPlugins; [
    # ui
    nvim-notify
    telescope-nvim
    telescope-fzf-native-nvim

    marks-nvim
    vim-bbye

    # lsp
    nvim-lspconfig
    cmp-nvim-lsp
    nvim-lsp-notify-plugin

    cmp-buffer
    cmp-path
    cmp-cmdline
    nvim-cmp
    cmp-nvim-lsp-signature-help
    luasnip
    cmp_luasnip

    lualine-nvim

    nvim-spectre
    which-key-nvim
    legendary-nvim
    dressing-nvim

    # git
    gitsigns-nvim

    # themes
    onedark-nvim

    # paredit
    nvim-paredit
    vim-repeat

    flash-nvim

    # Editing
    nvim-surround

    # treesitter
    nvim-treesitter.withAllGrammars
    nvim-treesitter-textobjects
    playground

    # clojure
    conjure
  ]
