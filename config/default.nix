{ pkgs, lib }:
let
  configDir = lang: pkgs.stdenv.mkDerivation {
        name = "nvim-${lang}-configs";
        src = ./${lang};
        installPhase = ''
          mkdir -p $out/lua/
          cp -r ./* $out/lua/
        '';
      };

  sourceConfigFiles = dir: ''
  set runtimepath+=${dir}
  luafile ${dir}/lua/init.lua
  '';

  lua = configDir "lua";
in sourceConfigFiles lua
