{ pkgs, nvim-lsp-notify }:
let
  nvim-lsp-notify-plugin = pkgs.vimUtils.buildVimPlugin{
          name = "nvim-lsp-notify";
          src = nvim-lsp-notify;
          };

in with pkgs.vimPlugins; [
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

  # themes
  onedark-nvim

  # sexp
  vim-sexp
  vim-sexp-mappings-for-regular-people
  vim-repeat

  # treesitter
  nvim-treesitter.withAllGrammars
  nvim-treesitter-textobjects
  playground

]
