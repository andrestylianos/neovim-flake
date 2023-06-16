{ pkgs }:
with pkgs.vimPlugins; [
  telescope-nvim
  nvim-lspconfig
  cmp-nvim-lsp
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

  nvim-treesitter.withAllGrammars
]
