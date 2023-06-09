{ pkgs }:
with pkgs.vimPlugins; [
  telescope-nvim
  nvim-lspconfig
  cmp-nvim-lsp
  cmp-buffer
  cmp-path
  cmp-cmdline
  nvim-cmp
]
