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
in
  with pkgs.vimPlugins; [
    # ui
    nvim-notify
    telescope-nvim
    telescope-fzf-native-nvim

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

    # sexp
    vim-sexp
    vim-sexp-mappings-for-regular-people
    vim-repeat
    
# ADD
    # nvim-paredit
    # sandwich?
    # hop, leap, etc?
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
