{pkgs}:
with pkgs; [
  lazygit
  fd
  ripgrep
  gnused

  # nix
  nixd
  alejandra

  # lua
  lua-language-server

  # packages with results in /lib/node_modules/.bin must come at the end
  nodePackages.typescript
  nodePackages.typescript-language-server
]
