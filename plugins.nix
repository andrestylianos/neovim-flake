{
  pkgs,
  inputs,
}: let
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
    nui-nvim
    noice-nvim
    telescope-nvim
    telescope-fzf-native-nvim
    todo-comments-nvim
    vim-illuminate
    nvim-web-devicons
    edgy-nvim

    marks-nvim
    vim-bbye
    nvim-autopairs

    # lsp
    nvim-lspconfig
    cmp-nvim-lsp
    lspsaga-nvim

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
    comment-nvim

    # treesitter
    nvim-treesitter.withAllGrammars
    nvim-treesitter-textobjects
    playground

    # clojure
    conjure
  ]
