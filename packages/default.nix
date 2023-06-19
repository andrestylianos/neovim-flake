{
  pkgs,
  lib,
  runtimeDeps,
  nvim-lsp-notify,
}: let
  customRC = import ../config {inherit pkgs lib;};
  plugins = import ../plugins.nix {inherit pkgs nvim-lsp-notify;};
  neovimRuntimeDependencies = pkgs.symlinkJoin {
    name = "neovimRuntimeDependencies";
    paths = runtimeDeps;
    # see: https://ertt.ca/blog/2022/01-12-nix-symlinkJoin-nodePackages/
    postBuild = ''
      for f in $out/lib/node_modules/.bin/*; do
         path="$(readlink --canonicalize-missing "$f")"
         ln -s "$path" "$out/bin/$(basename $f)"
      done
    '';
  };
  neovimUnwrapped = pkgs.wrapNeovim pkgs.neovim {
    configure = {
      inherit customRC;
      packages.all.start = plugins;
    };
  };
in
  pkgs.writeShellApplication {
    name = "nvim";
    runtimeInputs = [neovimRuntimeDependencies];
    text = ''
      ${neovimUnwrapped}/bin/nvim "$@"
    '';
  }
