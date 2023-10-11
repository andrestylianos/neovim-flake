{
  description = "My own Neovim flake";
  inputs = {
    nixpkgs = {
      url = "github:NixOS/nixpkgs";
    };
    neovim = {
      url = "github:neovim/neovim/stable?dir=contrib";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixd.url = "github:nix-community/nixd";

    flash-nvim = {
      url = "github:folke/flash.nvim";
      flake = false;
    };

    github-nvim-theme = {
      url = "github:projekt0n/github-nvim-theme";
      flake = false;
    };

    nvim-treesitter-sexp = {
      url = "github:PaterJason/nvim-treesitter-sexp";
      flake = false;
    };

    flake-parts.url = "github:hercules-ci/flake-parts";
  };
  outputs = inputs @ {flake-parts, ...}:
    flake-parts.lib.mkFlake {inherit inputs;} {
      systems = [
        "x86_64-linux"
        "aarch64-darwin"
      ];

      perSystem = {system, ...}: let
        overlayFlakeInputs = prev: final: {
          neovim = inputs.neovim.packages.${prev.stdenv.hostPlatform.system}.neovim;
        };

        pkgs = import inputs.nixpkgs {
          inherit system;
          overlays = [overlayFlakeInputs inputs.nixd.overlays.default];
        };

        dependencies = import ./runtimeDeps.nix {inherit pkgs;};

        overlayDefaultNeovim = prev: final: {
          defaultNeovim = import ./packages/default.nix {
            pkgs = final;
            lib = inputs.nixpkgs.lib;
            runtimeDeps = dependencies;
            inherit inputs;
          };
        };

        finalPkgs = import inputs.nixpkgs {
          inherit system;
          overlays = [overlayFlakeInputs overlayDefaultNeovim];
        };
      in {
        formatter = pkgs.alejandra;
        packages.default = finalPkgs.defaultNeovim;
        apps.default = {
          type = "app";
          program = "${finalPkgs.defaultNeovim}/bin/nvim";
        };

        devShells.default = finalPkgs.mkShell {
          buildInputs = with finalPkgs; [defaultNeovim] ++ dependencies;
        };
      };
    };
}
