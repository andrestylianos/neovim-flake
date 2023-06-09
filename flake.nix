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
  };
  outputs = { self, nixpkgs, neovim, nixd }:
    let
      overlayFlakeInputs = prev: final: {
        neovim = neovim.packages.x86_64-linux.neovim;
      };

      pkgs = import nixpkgs {
        system = "x86_64-linux";
        overlays = [ overlayFlakeInputs nixd.overlays.default ];
      };

      dependencies = import ./runtimeDeps.nix { inherit pkgs; };

      overlayDefaultNeovim = prev: final: {
        defaultNeovim = import ./packages/default.nix {
          pkgs = final;
          lib = nixpkgs.lib;
          runtimeDeps = dependencies;
        };
      };

      finalPkgs = import nixpkgs {
        system = "x86_64-linux";
        overlays = [ overlayFlakeInputs overlayDefaultNeovim ];
      };
    in {
      packages.x86_64-linux.default = finalPkgs.defaultNeovim;
      apps.x86_64-linux.default = {
        type = "app";
        program = "${finalPkgs.defaultNeovim}/bin/nvim";
      };

      devShells.x86_64-linux.default = finalPkgs.mkShell {
        buildInputs = with finalPkgs; [defaultNeovim] ++ dependencies;
      };
    };
}
