{ pkgs, lib }:
let
  scripts2ConfigFiles = dir:
    let
      configDir = pkgs.stdenv.mkDerivation {
        name = "nvim-${dir}-configs";
        src = ./${dir};
        installPhase = ''
          mkdir -p $out/
          cp -r ./* $out/
        '';
      };
    in lib.filesystem.listFilesRecursive configDir;

  sourceConfigFiles = files:
    builtins.concatStringsSep "\n" (builtins.map (file:
      "luafile ${file}") files);

  lua = scripts2ConfigFiles "lua";
in sourceConfigFiles lua
